"use client";

import { useState, useEffect, useRef } from "react";
import dynamicImport from "next/dynamic";
import { ImageIcon, VideoIcon, MusicIcon, Loader2, X } from "lucide-react";
import { ChatInput } from "@/components/chats/ChatInput";
import("html2pdf.js").then((module) => {
  // dynamic import will work inside client
});

import {
  Tabs,
  TabsContent,
  TabsList,
  TabsTrigger,
} from "@/components/ui/tabs";

import {
  ContactCards,
} from "@/components/contact_cards/ContactCards";

import ModelUploadPanel, {
  UploadItem,
} from "@/components/viewers/ModelUploadPanel";

//import { headers } from "next/headers";

const ModelViewerOBJ = dynamicImport(
  () => import("@/components/viewers/ModelViewerOBJ"),
  { ssr: false }
);

const MapViewer = dynamicImport(
  () => import("@/components/viewers/MapViewer"),
  { ssr: false }
);


/* ---------------- TYPES ---------------- */

type ChatMessage = {
  id: string;
  from: "user" | "assistant";
  text: string;
  timestamp: string;
};

type Reconstruction = {
  version: number;
  outputS3Prefix: string;
};

type ReportVersion = {
  id: string;
  projectId: string;
  version: number;
  content: string;
};

/* ---------------- AWS CONFIG ---------------- */

const AWS_BUCKET = "your-bucket-name";
const AWS_REGION = "ap-south-1";
/* ---------------- REPORT FORMATTER ---------------- */

function formatSectionContent(text: string) {
  if (!text) return "";

  const lines = text.split("\n");

  let html = "";
  let inOl = false;
  let inUl = false;

  const closeLists = () => {
    if (inOl) {
      html += "</ol>";
      inOl = false;
    }
    if (inUl) {
      html += "</ul>";
      inUl = false;
    }
  };

  lines.forEach((line) => {
    const trimmed = line.trim();
    if (!trimmed) {
      closeLists();
      return;
    }

    // Ordered list
    if (/^\d+\./.test(trimmed)) {
      if (!inOl) {
        closeLists();
        html += "<ol>";
        inOl = true;
      }
      html += `<li>${trimmed.replace(/^\d+\.\s*/, "")}</li>`;
    }

    // Unordered list
    else if (/^[\*\-\+]/.test(trimmed)) {
      if (!inUl) {
        closeLists();
        html += "<ul>";
        inUl = true;
      }
      html += `<li>${trimmed.replace(/^[\*\-\+]\s*/, "")}</li>`;
    }

    // Normal paragraph
    else {
      closeLists();
      html += `<p>${trimmed}</p>`;
    }
  });

  closeLists();

  return html;
}

function generateReportHTML(rawText: string) {
  return `
    <div style="
      font-family: Arial, sans-serif;
      padding:40px;
      line-height:1.6;
      color:#222;
    ">
      <h1 style="
        text-align:center;
        color:#b00020;
        margin-bottom:30px;
      ">
        Disaster Incident Report
      </h1>

      <div style="font-size:14px;">
        ${formatSectionContent(rawText)}
      </div>

      <hr style="margin-top:40px;" />

      <p style="
        font-size:11px;
        text-align:center;
        color:#777;
        margin-top:20px;
      ">
        This is a system-generated disaster response report.
      </p>
    </div>
  `;
}

/* ---------------- PAGE ---------------- */

export default function DashboardPage() {
  /* ---------- CHAT ---------- */
  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const [chatMounted, setChatMounted] = useState(false);
  const [chatLoading, setChatLoading] = useState(false);
  const chatBottomRef = useRef<HTMLDivElement>(null);

  // Load persisted history AFTER hydration (avoids SSR mismatch)
  useEffect(() => {
    const projectId = localStorage.getItem("projectId");
    const key = `chatMessages_${projectId ?? "default"}`;
    try {
      const saved = localStorage.getItem(key);
      if (saved) setMessages(JSON.parse(saved) as ChatMessage[]);
    } catch { /* ignore */ }
    setChatMounted(true);
  }, []);

  // Persist only after the load effect has run (skip the initial empty render)
  useEffect(() => {
    if (!chatMounted) return;
    const projectId = localStorage.getItem("projectId");
    const key = `chatMessages_${projectId ?? "default"}`;
    try {
      localStorage.setItem(key, JSON.stringify(messages));
    } catch { /* quota exceeded — ignore */ }
  }, [messages, chatMounted]);

  const handleSend = async (text: string) => {
    const projectId = typeof window !== "undefined" ? localStorage.getItem("projectId") : null;
    const now = new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" });

    setMessages((prev) => [
      ...prev,
      { id: crypto.randomUUID(), from: "user", text, timestamp: now },
    ]);
    setChatLoading(true);

    try {
      const res = await fetch(`${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/chat/${projectId}`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ message: text }),
      });
      const json = await res.json();
      const replyText = json.text || json.reply || json.response || "No response";
      setMessages((prev) => [
        ...prev,
        {
          id: crypto.randomUUID(),
          from: "assistant",
          text: replyText,
          timestamp: new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" }),
        },
      ]);
    } catch {
      setMessages((prev) => [
        ...prev,
        {
          id: crypto.randomUUID(),
          from: "assistant",
          text: "⚠️ Failed to get a response.",
          timestamp: new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" }),
        },
      ]);
    } finally {
      setChatLoading(false);
    }
  };

  /* ---------- UPLOAD STATE ---------- */
  const [files, setFiles] = useState<UploadItem[]>([]);
  const [dragging, setDragging] = useState(false);

  function handleFiles(selected: File[]) {
    const newFiles: UploadItem[] = selected.map((file) => ({
      id: crypto.randomUUID(),
      file,
      processing: true,
    }));

    setFiles((prev) => [...prev, ...newFiles]);

    newFiles.forEach((item) => {
      setTimeout(() => {
        setFiles((prev) =>
          prev.map((f) =>
            f.id === item.id ? { ...f, processing: false } : f
          )
        );
      }, 1500);
    });
  }

  function removeFile(id: string) {
    setFiles((prev) => prev.filter((f) => f.id !== id));
  }
  /*-------LOCATION---- */


  /* ---------- MODELS ---------- */
  const [loading, setLoading] = useState(false);
  const [modelUrl, setModelUrl] = useState<string | null>(null);
  const [reconstructions, setReconstructions] = useState<Reconstruction[]>([]);

  /* ---------- PDF PREVIEW ---------- */
  const [pdfZoom, setPdfZoom] = useState(0.7);
  const [reportGenerating, setReportGenerating] = useState(false);
  const [reportVersions, setReportVersions] = useState<ReportVersion[]>([]);
  const [selectedReport, setSelectedReport] = useState<ReportVersion | null>(null);

  /* ---------- UPLOAD MORE (INCIDENTS TAB) ---------- */
  const [uploadFiles2, setUploadFiles2] = useState<UploadItem[]>([]);
  const [dragging2, setDragging2] = useState(false);
  const [uploading2, setUploading2] = useState(false);

  function getFileIcon(type: string) {
    if (type.startsWith("image")) return ImageIcon;
    if (type.startsWith("video")) return VideoIcon;
    if (type.startsWith("audio")) return MusicIcon;
    return ImageIcon;
  }

  function handleFiles2(selected: File[]) {
    const newItems: UploadItem[] = selected.map((file) => ({
      id: crypto.randomUUID(),
      file,
      processing: true,
    }));
    setUploadFiles2((prev) => [...prev, ...newItems]);
    newItems.forEach((item) => {
      setTimeout(() => {
        setUploadFiles2((prev) =>
          prev.map((f) => f.id === item.id ? { ...f, processing: false } : f)
        );
      }, 1500);
    });
  }

  async function handleUploadMore() {
    const projectId = localStorage.getItem("projectId");
    if (!projectId) { alert("No project found."); return; }
    if (uploadFiles2.length === 0) { alert("No files selected."); return; }

    const formData = new FormData();
    uploadFiles2.forEach((item) => formData.append("files", item.file));

    try {
      setUploading2(true);
      const response = await fetch(
        `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/upload`,
        { method: "POST", body: formData }
      );
      if (!response.ok) throw new Error("Upload failed");
      console.log("Additional files uploaded successfully");
      setUploadFiles2([]);

      // Run analyze + event-summary once after successful upload
      try {
        await fetch(
          `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/analyze`,
          { method: "POST" }
        );
        await fetch(
          `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/event-summary`,
          { method: "POST" }
        );
        console.log("Pipeline re-run after additional upload");
      } catch (pipelineErr) {
        console.error("Pipeline re-run failed:", pipelineErr);
      }

      alert("Files uploaded and pipeline re-run successfully!");
    } catch (error) {
      console.error("Upload error:", error);
      alert("Failed to upload files.");
    } finally {
      setUploading2(false);
    }
  }

  function buildS3ModelPath(outputS3Prefix: string) {
    return `https://${process.env.NEXT_PUBLIC_AWS_S3_BUCKET}.s3.${process.env.NEXT_PUBLIC_AWS_REGION}.amazonaws.com/${outputS3Prefix}odm_texturing_25d/odm_textured_model_geo.obj`;
  }

  async function fetchReconstructions(): Promise<boolean> {
  if (typeof window === 'undefined') return false;
  const projectId = localStorage.getItem("projectId");
  if (!projectId) return false;

  try {
    const res = await fetch(
      `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/odm/projects/${projectId}/reconstructions`,
      { headers: { "ngrok-skip-browser-warning": "true",} }
    );
    
    if (!res.ok) return false;
    console.log("Reconstructions URL:", 
  `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/odm/projects/${projectId}/reconstructions`
);

    const data = await res.json();
    console.log("Fetched reconstructions:", data);
    setReconstructions(data);

    // ✅ stop condition: any reconstruction exists
    return Array.isArray(data) && data.length > 0;
  } catch (err) {
    console.error("Failed to fetch reconstructions", err);
    return false;
  }
}


  /* ---------- FETCH REPORT VERSIONS ---------- */
  async function fetchReportVersions() {
    if (typeof window === 'undefined') return;
    const projectId = localStorage.getItem("projectId");
    if (!projectId) return;
    try {
      const res = await fetch(
        `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/reports/${projectId}`,
        { headers: { "ngrok-skip-browser-warning": "true" } }
      );
      if (!res.ok) return;
      const json: { success: boolean; count: number; data: ReportVersion[] } = await res.json();
      const rdata = json.data ?? [];
      console.log("Fetched report versions:", rdata);
      setReportVersions(rdata);
      // Auto-select the latest version (first in descending order) if none selected
      if (rdata.length > 0) {
        setSelectedReport((prev) => prev ?? rdata[0]);
      }
    } catch (err) {
      console.error("Failed to fetch report versions:", err);
    }
  }

  /* ---------- GENERATE REPORT ---------- */
  async function generateReport() {
    if (typeof window === 'undefined') return;
    const projectId = localStorage.getItem("projectId");
    if (!projectId) { alert("No project found. Please create a project first."); return; }

    setReportGenerating(true);
    try {
      const reportRes = await fetch(
        `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/reports/projects/${projectId}/report`,
        { method: "POST" }
      );
      console.log("Report response:", reportRes);
      const assistantId = crypto.randomUUID();

      setMessages((prev) => [
        ...prev,
        {
          id: assistantId,
          from: "assistant",
          text: "🧠 Generating report...\n\n",
          timestamp: new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" }),
        },
      ]);

      const reader = reportRes.body!.getReader();
      const decoder = new TextDecoder();

      let buffer = "";
      let fullText = "";

      while (true) {
        const { value, done } = await reader.read();
        if (done) break;

        buffer += decoder.decode(value, { stream: true });
        const lines = buffer.split("\n");
        buffer = lines.pop()!;

        for (const line of lines) {
          if (!line.trim()) continue;
          const msg = JSON.parse(line);
          if (msg.stage === "Textgen_stream" && msg.chunk) {
            fullText += msg.chunk;
            setMessages((prev) =>
              prev.map((m) =>
                m.id === assistantId ? { ...m, text: fullText } : m
              )
            );
          }
        }
      }
      // After report fully streamed
      localStorage.setItem("latestReport", fullText);
      console.log("Report response:", reportRes);
      setMessages((prev) => prev.map((m) =>
        m.id === assistantId ? { ...m, text: fullText } : m
      ));
      // Refresh versions list and auto-select new version
      await fetchReportVersions();
    } catch {
      setMessages((prev) => [
        ...prev,
        {
          id: crypto.randomUUID(),
          from: "assistant",
          text: "⚠️ Failed to generate report.",
          timestamp: new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" }),
        },
      ]);
    } finally {
      setReportGenerating(false);
    }
  }

  /* ---------- AUTO-SCROLL CHAT TO BOTTOM ---------- */
  useEffect(() => {
    chatBottomRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages, chatLoading]);

  /* ---------- FETCH REPORT VERSIONS ON MOUNT ---------- */
  useEffect(() => {
    fetchReportVersions();
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);



  async function downloadPDF(reportText: string) {
    try {
      const { jsPDF } = await import("jspdf");
      
      const doc = new jsPDF({
        orientation: "portrait",
        unit: "mm",
        format: "a4",
      });

      const pageWidth = doc.internal.pageSize.getWidth();
      const pageHeight = doc.internal.pageSize.getHeight();
      const margin = 15;
      const contentWidth = pageWidth - 2 * margin;
      let yPosition = margin + 10;

      // Parse the text - handle JSON if present
      let cleanText = reportText;
      try {
        const parsed = JSON.parse(reportText);
        cleanText = parsed.fullText || parsed.text || reportText;
      } catch {
        // Not JSON, use as-is
      }

      // Convert literal \n to actual newlines and clean up
      cleanText = cleanText
        .replace(/\\n/g, "\n")
        .replace(/\\"/g, '"')
        .replace(/\*\*/g, "")
        .trim();

      // Title
      doc.setFontSize(20);
      doc.setFont("helvetica", "bold");
      doc.text("Disaster Incident Report", pageWidth / 2, yPosition, { align: "center" });
      yPosition += 12;

      // Horizontal line
      doc.setLineWidth(0.5);
      doc.line(margin, yPosition, pageWidth - margin, yPosition);
      yPosition += 10;

      // Process content by sections
      const sections = cleanText.split(/\n\n+/);
      
      for (const section of sections) {
        const lines = section.split("\n");
        
        for (let i = 0; i < lines.length; i++) {
          let line = lines[i].trim();
          if (!line) continue;

          // Check if this is a section header (ends with : or contains specific keywords)
          const isHeader = /^[A-Z][^.]*:$/.test(line) || 
                          /^(Situation Understanding|Current Disaster Status|Step-by-Step|Immediate Action Plan|Location|Latitude|Longitude)/i.test(line);

          // Check if it's a numbered item
          const isNumbered = /^\d+\./.test(line);

          // Check for page break needed
          if (yPosition > pageHeight - margin - 15) {
            doc.addPage();
            yPosition = margin;
          }

          if (isHeader) {
            yPosition += 4;
            doc.setFontSize(12);
            doc.setFont("helvetica", "bold");
            const wrappedLines = doc.splitTextToSize(line, contentWidth);
            for (const wl of wrappedLines) {
              if (yPosition > pageHeight - margin - 10) {
                doc.addPage();
                yPosition = margin;
              }
              doc.text(wl, margin, yPosition);
              yPosition += 6;
            }
            yPosition += 2;
          } else if (isNumbered) {
            doc.setFontSize(10);
            doc.setFont("helvetica", "normal");
            const wrappedLines = doc.splitTextToSize(line, contentWidth - 5);
            for (const wl of wrappedLines) {
              if (yPosition > pageHeight - margin - 10) {
                doc.addPage();
                yPosition = margin;
              }
              doc.text(wl, margin + 5, yPosition);
              yPosition += 5;
            }
          } else {
            doc.setFontSize(10);
            doc.setFont("helvetica", "normal");
            const wrappedLines = doc.splitTextToSize(line, contentWidth);
            for (const wl of wrappedLines) {
              if (yPosition > pageHeight - margin - 10) {
                doc.addPage();
                yPosition = margin;
              }
              doc.text(wl, margin, yPosition);
              yPosition += 5;
            }
          }
        }
        yPosition += 3; // Space between sections
      }

      // Footer on each page
      const pageCount = doc.getNumberOfPages();
      for (let i = 1; i <= pageCount; i++) {
        doc.setPage(i);
        doc.setFontSize(8);
        doc.setFont("helvetica", "italic");
        doc.text(
          `Page ${i} of ${pageCount} | System-generated disaster response report`,
          pageWidth / 2,
          pageHeight - 8,
          { align: "center" }
        );
      }

      doc.save("disaster_report.pdf");
      console.log("PDF saved successfully");
    } catch (err) {
      console.error("Error generating PDF:", err);
      alert("Failed to generate PDF. Check console for details.");
    }
  }

  useEffect(() => {
    let intervalId: NodeJS.Timeout | null = null;
    let stopped = false;

    const startPolling = async () => {
      // run immediately once
      const ready = await fetchReconstructions();

      if (ready) return;

      intervalId = setInterval(async () => {
        if (stopped) return;

        const done = await fetchReconstructions();

        if (done && intervalId) {
          clearInterval(intervalId);
          intervalId = null;
        }
      }, 10_000); // 10 seconds
    };

    startPolling();

    return () => {
      stopped = true;
      if (intervalId) clearInterval(intervalId);
    };
  }, []);


  /* ---------------- UI ---------------- */

  return (
    <main className="min-h-screen bg-[#0b0a0b] flex justify-center p-6 text-white">
      <div className="w-full max-w-7xl flex flex-col">

        <Tabs
          defaultValue="chat"
          onValueChange={() => setModelUrl(null)}
          className="flex flex-col flex-1"
        >
          <TabsList className="bg-[#191918] border border-white/10 rounded-xl px-1 py-1 gap-1 self-center">
            {["chat", "upload more", "emergency", "reports", "models","location"].map((v) => (
              <TabsTrigger
                key={v}
                value={v}
                className="
                  px-4 py-2 text-sm capitalize rounded-lg transition
                  text-white/60
                  data-[state=active]:bg-white
                  data-[state=active]:text-black
                "
              >
                {v}
              </TabsTrigger>
            ))}
          </TabsList>

          <div className="mt-6 flex-1 w-full rounded-xl border border-white/10 bg-[#0f0e0f] p-6 overflow-hidden">

            {/* CHAT */}
            <TabsContent value="chat" className="h-full flex flex-col">
              {/* Messages area */}
              <div className="overflow-y-auto rounded-xl border border-white/10 bg-[#0b0a0b] p-4 flex flex-col gap-3" style={{ height: "calc(100vh - 320px)", minHeight: "300px" }}>
                {messages.length === 0 && !chatLoading && (
                  <div className="flex-1 flex items-center justify-center text-sm text-white/25 select-none">
                    Start the conversation…
                  </div>
                )}

                {messages.map((msg) => (
                  <div
                    key={msg.id}
                    className={`flex flex-col gap-1 ${
                      msg.from === "user" ? "items-end" : "items-start"
                    }`}
                  >
                    <div
                      className={`max-w-[72%] rounded-2xl px-4 py-2.5 text-sm leading-relaxed whitespace-pre-wrap break-words ${
                        msg.from === "user"
                          ? "bg-white text-black rounded-br-sm"
                          : "bg-[#1f1e1f] text-white border border-white/10 rounded-bl-sm"
                      }`}
                    >
                      {msg.text}
                    </div>
                    <span className="text-[10px] text-white/30 px-1">{msg.timestamp}</span>
                  </div>
                ))}

                {/* Typing indicator */}
                {chatLoading && (
                  <div className="flex flex-col items-start gap-1">
                    <div className="bg-[#1f1e1f] border border-white/10 rounded-2xl rounded-bl-sm px-4 py-3 flex items-center gap-1.5">
                      <span className="w-1.5 h-1.5 bg-white/50 rounded-full animate-bounce" style={{ animationDelay: "0ms" }} />
                      <span className="w-1.5 h-1.5 bg-white/50 rounded-full animate-bounce" style={{ animationDelay: "150ms" }} />
                      <span className="w-1.5 h-1.5 bg-white/50 rounded-full animate-bounce" style={{ animationDelay: "300ms" }} />
                    </div>
                    <span className="text-[10px] text-white/30 px-1">Typing…</span>
                  </div>
                )}

                <div ref={chatBottomRef} />
              </div>

              {/* Input */}
              <div className="mt-3">
                <ChatInput onSend={handleSend} disabled={chatLoading} />
              </div>
            </TabsContent>

            {/* UPLOAD MORE */}
            <TabsContent value="upload more" className="h-full flex flex-col gap-4 max-w-lg mx-auto w-full pt-4">
              {/* Drop Zone */}
              <div
                onDragOver={(e) => { e.preventDefault(); setDragging2(true); }}
                onDragLeave={() => setDragging2(false)}
                onDrop={(e) => { e.preventDefault(); setDragging2(false); handleFiles2(Array.from(e.dataTransfer.files)); }}
                className={`border-2 border-dashed rounded-xl p-8 text-center cursor-pointer transition ${
                  dragging2 ? "border-white bg-white/5" : "border-white/20 hover:border-white/40"
                }`}
              >
                <input
                  type="file"
                  multiple
                  hidden
                  id="uploadMore"
                  onChange={(e) => handleFiles2(e.target.files ? Array.from(e.target.files) : [])}
                />
                <label htmlFor="uploadMore" className="cursor-pointer flex flex-col items-center gap-2">
                  <ImageIcon className="h-8 w-8 text-white/30" />
                  <p className="text-sm text-white/70">Drag & drop images / audio / video here</p>
                  <p className="text-xs text-white/40">or click to browse</p>
                </label>
              </div>

              {/* File List */}
              {uploadFiles2.length > 0 && (
                <div className="space-y-2">
                  {uploadFiles2.map((item) => {
                    const Icon = getFileIcon(item.file.type);
                    return (
                      <div
                        key={item.id}
                        className="flex items-center justify-between gap-3 rounded-md border border-white/10 bg-[#191918] px-3 py-2 text-sm"
                      >
                        <div className="flex items-center gap-3 min-w-0">
                          {item.processing ? (
                            <Loader2 className="h-4 w-4 animate-spin text-white/70" />
                          ) : (
                            <Icon className="h-4 w-4 text-white/70" />
                          )}
                          <span className="truncate text-white/80">{item.file.name}</span>
                        </div>
                        <button onClick={() => setUploadFiles2((prev) => prev.filter((f) => f.id !== item.id))} className="text-white/50 hover:text-white">
                          <X className="h-4 w-4" />
                        </button>
                      </div>
                    );
                  })}
                </div>
              )}

              {/* Submit Button */}
              <button
                onClick={handleUploadMore}
                disabled={uploading2 || uploadFiles2.length === 0}
                className="w-full py-2 rounded-lg bg-white text-black text-sm font-medium hover:bg-white/90 transition disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
              >
                {uploading2 ? (
                  <><Loader2 className="h-4 w-4 animate-spin" /> Uploading...</>
                ) : (
                  "Submit Additional Files"
                )}
              </button>
            </TabsContent>

            {/* EMERGENCY */}
            <TabsContent value="emergency" className="h-full overflow-auto">
              <ContactCards />
            </TabsContent>

            {/* REPORTS */}
            <TabsContent value="reports" className="h-[650px] grid grid-cols-12 gap-4">

              {/* LEFT - Report Versions List */}
              <div className="col-span-3 flex flex-col gap-4 h-full overflow-auto">
                {/* Create Report Button */}
                <button
                  onClick={generateReport}
                  disabled={reportGenerating}
                  className="w-full px-4 py-2 rounded-lg bg-white text-black text-sm font-medium hover:bg-white/90 transition disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
                >
                  + Create Latest Report
                </button>

                {/* Loading UI */}
                {reportGenerating && (
                  <div className="rounded-xl border border-white/10 bg-[#0b0a0b] p-4 flex flex-col items-center gap-3">
                    <div className="flex gap-1 items-end h-6">
                      <span className="w-1.5 bg-white/60 rounded-full animate-bounce" style={{ height: '10px', animationDelay: '0ms' }} />
                      <span className="w-1.5 bg-white/60 rounded-full animate-bounce" style={{ height: '16px', animationDelay: '150ms' }} />
                      <span className="w-1.5 bg-white/60 rounded-full animate-bounce" style={{ height: '10px', animationDelay: '300ms' }} />
                      <span className="w-1.5 bg-white/60 rounded-full animate-bounce" style={{ height: '20px', animationDelay: '150ms' }} />
                      <span className="w-1.5 bg-white/60 rounded-full animate-bounce" style={{ height: '10px', animationDelay: '0ms' }} />
                    </div>
                    <p className="text-xs text-white/60 text-center">Generating report…</p>
                    <p className="text-[10px] text-white/30 text-center">This may take a moment</p>
                  </div>
                )}

                <div className="rounded-xl border border-white/10 bg-[#0b0a0b] p-3">
                  <h3 className="text-sm font-medium text-white/80 mb-3">Report Versions</h3>
                  
                  <div className="space-y-2">
                    {reportVersions.length === 0 ? (
                      <p className="text-xs text-white/40 text-center py-4">
                        No reports generated yet
                      </p>
                    ) : (
                      reportVersions.map((report) => (
                        <div
                          key={report.id}
                          className={`p-2 rounded-lg border transition cursor-pointer ${
                            selectedReport?.id === report.id
                              ? "border-white/40 bg-white/10"
                              : "border-white/10 bg-[#191918] hover:bg-white/5"
                          }`}
                          onClick={() => setSelectedReport(report)}
                        >
                          <div className="flex items-center justify-between mb-2">
                            <span className="text-xs font-medium text-white">
                              Version {report.version}
                            </span>
                          </div>

                          <div className="flex gap-2">
                            <button
                              onClick={(e) => {
                                e.stopPropagation();
                                if (report.content) downloadPDF(report.content);
                                else alert("No content available for this version");
                              }}
                              className="flex-1 text-[10px] px-2 py-1 rounded bg-white text-black hover:bg-white/90 transition"
                            >
                              Download PDF
                            </button>
                            <button
                              onClick={(e) => {
                                e.stopPropagation();
                                setSelectedReport(report);
                              }}
                              className="flex-1 text-[10px] px-2 py-1 rounded border border-white/20 text-white hover:bg-white/10 transition"
                            >
                              Preview
                            </button>
                          </div>
                        </div>
                      ))
                    )}
                  </div>
                </div>
              </div>

              {/* RIGHT - PDF Preview */}
              <div className="col-span-9 border border-white/10 rounded-xl bg-[#2a2a2a] overflow-hidden flex flex-col h-full">
                {/* PDF Preview Header */}
                <div className="flex items-center justify-between px-4 py-2 border-b border-white/10 bg-[#0f0e0f] flex-shrink-0">
                  <span className="text-sm text-white/60">
                    {selectedReport
                      ? `Report Preview — Version ${selectedReport.version}`
                      : "Report Preview"}
                  </span>
                  <div className="flex items-center gap-3">
                    {/* Zoom Controls */}
                    <div className="flex items-center gap-1 bg-white/10 rounded px-2 py-1">
                      <button
                        onClick={() => setPdfZoom(z => Math.max(0.3, z - 0.1))}
                        className="text-white hover:text-white/80 text-sm px-1"
                        title="Zoom Out"
                      >
                        −
                      </button>
                      <span className="text-xs text-white/60 w-12 text-center">
                        {Math.round(pdfZoom * 100)}%
                      </span>
                      <button
                        onClick={() => setPdfZoom(z => Math.min(1.5, z + 0.1))}
                        className="text-white hover:text-white/80 text-sm px-1"
                        title="Zoom In"
                      >
                        +
                      </button>
                    </div>
                    <button
                      onClick={() => {
                        if (selectedReport?.content) downloadPDF(selectedReport.content);
                        else alert("No report selected");
                      }}
                      className="text-xs px-3 py-1 rounded bg-white text-black hover:bg-white/90 transition"
                    >
                      Download
                    </button>
                  </div>
                </div>

                {/* PDF Content Preview - Scrollable container with fixed height */}
                <div className="flex-1 overflow-auto p-4 bg-[#525659] min-h-0">
                  <div className="flex justify-center pb-4" style={{ minHeight: `${842 * pdfZoom + 32}px` }}>
                  {/* A4 Page Container - 210mm x 297mm ratio (1:1.414) */}
                  <div 
                    className="bg-white shadow-2xl origin-top"
                    style={{
                      width: '595px', // A4 width at 72 DPI
                      minHeight: '842px', // A4 height at 72 DPI
                      padding: '40px',
                      transform: `scale(${pdfZoom})`,
                      transformOrigin: 'top center',
                    }}
                  >
                    {/* PDF Header */}
                    <h1 
                      style={{
                        fontSize: '20px',
                        fontWeight: 'bold',
                        textAlign: 'center',
                        color: '#000',
                        marginBottom: '12px',
                        fontFamily: 'Helvetica, Arial, sans-serif',
                      }}
                    >
                      Disaster Incident Report
                    </h1>
                    
                    {/* Horizontal line */}
                    <hr style={{ 
                      border: 'none', 
                      borderTop: '1px solid #000', 
                      marginBottom: '20px' 
                    }} />
                    
                    {/* Preview content - matching PDF structure */}
                    <div style={{ fontFamily: 'Helvetica, Arial, sans-serif' }}>
                      {selectedReport?.content ? (
                        (() => {
                          let reportText = selectedReport.content;
                          
                          // Parse JSON if present
                          try {
                            const parsed = JSON.parse(reportText);
                            reportText = parsed.fullText || parsed.text || reportText;
                          } catch {
                            // Not JSON, use as-is
                          }
                          
                          // Clean up text
                          const cleanText = reportText
                            .replace(/\\n/g, "\n")
                            .replace(/\\"/g, '"')
                            .replace(/\*\*/g, "")
                            .trim();
                          
                          // Split into sections
                          const sections = cleanText.split(/\n\n+/);
                          
                          return sections.map((section, sectionIdx) => {
                            const lines = section.split("\n");
                            
                            return (
                              <div key={sectionIdx} style={{ marginBottom: '12px' }}>
                                {lines.map((line, lineIdx) => {
                                  const trimmedLine = line.trim();
                                  if (!trimmedLine) return null;
                                  
                                  // Check if header
                                  const isHeader = /^[A-Z][^.]*:$/.test(trimmedLine) || 
                                    /^(Situation Understanding|Current Disaster Status|Step-by-Step|Immediate Action Plan|Location|Latitude|Longitude)/i.test(trimmedLine);
                                  
                                  // Check if numbered
                                  const isNumbered = /^\d+\./.test(trimmedLine);
                                  
                                  if (isHeader) {
                                    return (
                                      <p 
                                        key={lineIdx}
                                        style={{
                                          fontSize: '12px',
                                          fontWeight: 'bold',
                                          color: '#000',
                                          marginTop: '16px',
                                          marginBottom: '6px',
                                        }}
                                      >
                                        {trimmedLine}
                                      </p>
                                    );
                                  } else if (isNumbered) {
                                    return (
                                      <p 
                                        key={lineIdx}
                                        style={{
                                          fontSize: '10px',
                                          color: '#000',
                                          marginLeft: '20px',
                                          marginBottom: '4px',
                                          lineHeight: '1.5',
                                        }}
                                      >
                                        {trimmedLine}
                                      </p>
                                    );
                                  } else {
                                    return (
                                      <p 
                                        key={lineIdx}
                                        style={{
                                          fontSize: '10px',
                                          color: '#000',
                                          marginBottom: '4px',
                                          lineHeight: '1.5',
                                        }}
                                      >
                                        {trimmedLine}
                                      </p>
                                    );
                                  }
                                })}
                              </div>
                            );
                          });
                        })()
                      ) : (
                        <div style={{ 
                          textAlign: 'center', 
                          color: '#999', 
                          paddingTop: '200px' 
                        }}>
                          <p style={{ fontSize: '24px', marginBottom: '8px' }}>📄</p>
                          <p style={{ fontSize: '14px' }}>Select a report version to preview</p>
                        </div>
                      )}
                    </div>

                    {/* Footer */}
                    <div style={{ 
                      marginTop: '40px', 
                      borderTop: '1px solid #ccc', 
                      paddingTop: '10px' 
                    }}>
                      <p style={{ 
                        fontSize: '8px', 
                        textAlign: 'center', 
                        color: '#777',
                        fontStyle: 'italic',
                        fontFamily: 'Helvetica, Arial, sans-serif',
                      }}>
                        Page 1 | System-generated disaster response report
                      </p>
                    </div>
                  </div>
                  </div>
                </div>
              </div>

            </TabsContent>

            {/* MODELS */}
            <TabsContent value="models" className="h-full grid grid-cols-12 gap-4">

              {/* LEFT */}
              <div className="col-span-3 flex flex-col gap-4">
                <div className="rounded-xl border border-white/10 bg-[#0b0a0b] p-3">
                  <ModelUploadPanel
                    files={files}
                    dragging={dragging}
                    setDragging={setDragging}
                    onFiles={handleFiles}
                    onRemove={removeFile}
                    projectId={typeof window !== 'undefined' ? localStorage.getItem("projectId") || "" : ""}
                    setGlobalLoading={setLoading}
                    onUploadComplete={fetchReconstructions}
                    disabled={loading}
                  />
                </div>

                <div className="rounded-xl border border-white/10 bg-[#0b0a0b] p-2 space-y-1">
                  {reconstructions.length === 0 && (
                    <p className="text-xs text-white/40 text-center py-4">
                      No reconstructions yet
                    </p>
                  )}

                  {reconstructions.map((r) => (
                    <button
                      key={r.version}
                      onClick={() =>
                        setModelUrl(buildS3ModelPath(r.outputS3Prefix))
                      }
                      className="w-full text-left text-xs px-2 py-1 rounded hover:bg-white/10 transition"
                    >
                      Version {r.version}
                    </button>
                  ))}
                </div>
              </div>

              {/* RIGHT */}
              <div className="relative col-span-9 border border-white/10 rounded-xl bg-black overflow-hidden">
                {loading && (
                  <div className="absolute inset-0 z-10 flex flex-col items-center justify-center gap-3 bg-black/70 rounded-xl">
                    <Loader2 className="h-8 w-8 animate-spin text-white" />
                    <p className="text-sm text-white/80">Processing 3D reconstruction…</p>
                  </div>
                )}
                {modelUrl ? (
                  <ModelViewerOBJ
                    modelPath={modelUrl}
                    onClose={() => setModelUrl(null)}
                  />
                ) : (
                  <div className="h-full flex flex-col items-center justify-center text-white/40 text-sm gap-2">
                    <span>🧩</span>
                    <span>Select a 3D model version</span>
                  </div>
                )}
              </div>

            </TabsContent>

            {/* MAP */}
<TabsContent value="location" className="h-full">
  <div className="rounded-xl border border-white/10 bg-[#0b0a0b] overflow-hidden" style={{ height: "calc(100vh - 180px)" }}>
    <MapViewer />
  </div>
</TabsContent>


          </div>
        </Tabs>
      </div>
    </main>
  );
}