"use client";

import { useState, useRef, useEffect } from "react";
import dynamicImport from "next/dynamic";

import { Conversation } from "@/components/chats/Chats";
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
  contactCardsData,
} from "@/components/contact_cards/ContactCards";

import ModelUploadPanel, {
  UploadItem,
} from "@/components/viewers/ModelUploadPanel";

import FullscreenLoader from "@/components/ui/FullscreenLoader";
//import { headers } from "next/headers";

const ModelViewerOBJ = dynamicImport(
  () => import("@/components/viewers/ModelViewerOBJ"),
  { ssr: false }
);


/* ---------------- TYPES ---------------- */

type ChatMessage = {
  id: string;
  from: "user" | "assistant";
  text: string;
};

type Reconstruction = {
  version: number;
  outputS3Prefix: string;
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
  const hasRun = useRef(false);

  const handleSend = (text: string) => {
    setMessages((prev) => [
      ...prev,
      { id: crypto.randomUUID(), from: "user", text },
    ]);
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

  /* ---------- MODELS ---------- */
  const [loading, setLoading] = useState(false);
  const [modelUrl, setModelUrl] = useState<string | null>(null);
  const [reconstructions, setReconstructions] = useState<Reconstruction[]>([]);

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


  /* ---------- EXISTING PIPELINE (UNCHANGED) ---------- */
  useEffect(() => {
    if (typeof window === 'undefined') return;
    if (hasRun.current) return;
    hasRun.current = true;

    const projectId = localStorage.getItem("projectId");
    if (!projectId) return;

    const runPipeline = async () => {
      try {
        const analyzeRes = await fetch(
          `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/analyze`,
          { method: "POST" }
        );
        console.log("Analyze response:", analyzeRes);
        

        const eventSummaryRes = await fetch(
          `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/event-summary`,
          { method: "POST" }
        );
        console.log("Event summary response:", eventSummaryRes);


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
      } catch {
        setMessages((prev) => [
          ...prev,
          {
            id: crypto.randomUUID(),
            from: "assistant",
            text: "⚠️ Failed to generate report.",
          },
        ]);
      }
    };

    runPipeline();
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
            {["chat", "incidents", "emergency", "reports", "models"].map((v) => (
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
              <div className="flex-1 overflow-hidden rounded-lg border border-white/10 bg-[#0b0a0b]">
                <Conversation
                  messages={messages}
                  className="h-full p-4 text-sm leading-relaxed whitespace-pre-wrap"
                >
                  {messages.map((msg) => (
                    <div key={msg.id}>
                      <strong>{msg.from}:</strong> {msg.text}
                    </div>
                  ))}
                </Conversation>
              </div>
              <div className="mt-3">
                <ChatInput onSend={handleSend} />
              </div>
            </TabsContent>

            {/* EMERGENCY */}
            <TabsContent value="emergency">
              <ContactCards data={contactCardsData} />
            </TabsContent>

            {/* REPORTS */}
            <TabsContent value="reports" className="h-full flex flex-col gap-4">
              <button
                onClick={() => {
                  if (typeof window === 'undefined') return;
                  const report = localStorage.getItem("latestReport");
                  if (report) downloadPDF(report);
                  else alert("No report available yet.");
                }}
                className="bg-white text-black px-4 py-2 rounded-lg w-fit"
              >
                Download Report PDF
              </button>
            </TabsContent>

            {/* MODELS */}
            <TabsContent value="models" className="h-full grid grid-cols-12 gap-4">

              {loading && (
                <FullscreenLoader text="Processing 3D reconstruction…" />
              )}

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
              <div className="col-span-9 border border-white/10 rounded-xl bg-black overflow-hidden">
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
          </div>
        </Tabs>
      </div>
    </main>
  );
}