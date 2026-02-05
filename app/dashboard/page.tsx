"use client";

import { useState, useRef, useEffect } from "react";
import dynamic from "next/dynamic";
import { Conversation } from "@/components/chats/Chats";
import { ChatInput } from "@/components/chats/ChatInput";

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

const ModelViewerOBJ = dynamic(
  () => import("@/components/viewers/ModelViewerOBJ"),
  { ssr: false }
);

type ChatMessage = {
  id: string;
  from: "user" | "assistant";
  text: string;
};

export default function DashboardPage() {
  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const hasRun = useRef(false);

  const handleSend = (text: string) => {
    setMessages((prev) => [
      ...prev,
      { id: crypto.randomUUID(), from: "user", text },
    ]);
  };

  /* Upload state */
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
      }, 2000);
    });
  }

  function removeFile(id: string) {
    setFiles((prev) => prev.filter((f) => f.id !== id));
  }

  /* TEMP generated models */
  const [generatedModels] = useState<string[]>([
    "/3d/temp_3d.obj",
    "/3d/new_3d.obj",
  ]);

  const [modelUrl, setModelUrl] = useState<string | null>(null);

  /* Pipeline */
  useEffect(() => {
    if (hasRun.current) return;
    hasRun.current = true;

    const projectId = localStorage.getItem("projectId");
    if (!projectId) return;

    const runPipeline = async () => {
      try {
        await fetch(
          `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/analyze`,
          { method: "POST" }
        );

        await fetch(
          `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/event-summary`,
          { method: "POST" }
        );

        const reportRes = await fetch(
          `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/report`,
          { method: "POST" }
        );

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

            if (msg.stage === "text_gen_stream" && msg.chunk) {
              fullText += msg.chunk;

              setMessages((prev) =>
                prev.map((m) =>
                  m.id === assistantId ? { ...m, text: fullText } : m
                )
              );
            }
          }
        }
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

  return (
    <main className="min-h-screen bg-[#0b0a0b] flex justify-center p-6 text-white">
      <div className="w-full max-w-7xl flex flex-col">
        <Tabs
          defaultValue="chat"
          onValueChange={() => setModelUrl(null)}
          className="flex flex-col flex-1"
        >
          {/* Tabs */}
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

          {/* Content frame */}
          <div className="mt-6 flex-1 w-full rounded-xl border border-white/10 bg-[#0f0e0f] p-6 overflow-hidden">

            {/* CHAT */}
            <TabsContent value="chat" className="h-full flex flex-col">
              <div className="flex-1 overflow-hidden rounded-lg border border-white/10 bg-[#0b0a0b]">
                <Conversation
                  messages={messages}
                  className="h-full p-4 text-sm leading-relaxed whitespace-pre-wrap"
                />
              </div>

              <div className="mt-3">
                <ChatInput onSend={handleSend} />
              </div>
            </TabsContent>

            {/* EMERGENCY */}
            <TabsContent value="emergency">
              <ContactCards data={contactCardsData} />
            </TabsContent>

            {/* MODELS */}
            <TabsContent value="models" className="h-full grid grid-cols-12 gap-4">
              {/* Left panel */}
              <div className="col-span-3 flex flex-col gap-4">
                <div className="rounded-xl border border-white/10 bg-[#0b0a0b] p-3">
                  <ModelUploadPanel
                    files={files}
                    dragging={dragging}
                    setDragging={setDragging}
                    onFiles={handleFiles}
                    onRemove={removeFile}
                  />
                </div>

                <div className="rounded-xl border border-white/10 bg-[#0b0a0b] p-2 space-y-1">
                  {generatedModels.map((m) => (
                    <button
                      key={m}
                      onClick={() => setModelUrl(m)}
                      className="w-full text-left text-xs px-2 py-1 rounded hover:bg-white/10 transition"
                    >
                      {m.split("/").pop()}
                    </button>
                  ))}
                </div>
              </div>

              {/* Viewer */}
              <div className="col-span-9 border border-white/10 rounded-xl bg-black overflow-hidden">
                {modelUrl ? (
                  <ModelViewerOBJ
                    modelPath={modelUrl}
                    onClose={() => setModelUrl(null)}
                  />
                ) : (
                  <div className="h-full flex flex-col items-center justify-center text-white/40 text-sm gap-2">
                    <span>🧩</span>
                    <span>Select a 3D model to preview</span>
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
