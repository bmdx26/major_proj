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
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardDescription,
} from "@/components/ui/card";

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
          { id: assistantId, from: "assistant", text: "🧠 Generating report...\n\n" },
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

            if (msg.stage === "llama_stream" && msg.chunk) {
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
    <main className="min-h-screen bg-[#0b0a0b] flex justify-center p-8 text-white">
      <div className="w-full flex flex-col">
        <Tabs defaultValue="chat" onValueChange={() => setModelUrl(null)}>
          <TabsList className="bg-[#191918] border border-white/10 rounded-lg px-1">
            {["chat", "incidents", "emergency", "reports", "models"].map((v) => (
              <TabsTrigger key={v} value={v}>
                {v}
              </TabsTrigger>
            ))}
          </TabsList>

          <div className="mt-6 flex-1 w-full border-2 border-dashed border-white/20 p-6">

            <TabsContent value="chat" className="h-full flex flex-col">
              <Conversation messages={messages} className="flex-1" />
              <ChatInput onSend={handleSend} />
            </TabsContent>

            <TabsContent value="emergency">
              <ContactCards data={contactCardsData} />
            </TabsContent>

            <TabsContent value="models" className="h-full grid grid-cols-10 gap-4">
              <div className="col-span-2 flex flex-col gap-4">
                <ModelUploadPanel
                  files={files}
                  dragging={dragging}
                  setDragging={setDragging}
                  onFiles={handleFiles}
                  onRemove={removeFile}
                />

                <div className="border border-white/10 rounded-lg p-2">
                  {generatedModels.map((m) => (
                    <button
                      key={m}
                      onClick={() => setModelUrl(m)}
                      className="w-full text-left text-xs hover:bg-white/10"
                    >
                      {m.split("/").pop()}
                    </button>
                  ))}
                </div>
              </div>

              <div className="col-span-8 border border-white/10 rounded-lg">
                {modelUrl ? (
                  <ModelViewerOBJ
                    modelPath={modelUrl}
                    onClose={() => setModelUrl(null)}
                  />
                ) : (
                  <div className="h-full flex items-center justify-center text-white/40">
                    Select model
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
