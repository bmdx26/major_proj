"use client"


import { useState, useRef, useEffect } from "react"

import dynamic from "next/dynamic"
import { Conversation } from "@/components/chats/Chats"
import { ChatInput } from "@/components/chats/ChatInput"

import {
  Tabs,
  TabsContent,
  TabsList,
  TabsTrigger,
} from "@/components/ui/tabs"
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardDescription,
} from "@/components/ui/card"

import {
  ContactCards,
  contactCardsData,
} from "@/components/contact_cards/ContactCards"

/* OBJ 3D viewer (client only) */
const ModelViewerOBJ = dynamic(
  () => import("@/components/viewers/ModelViewerOBJ"),
  { ssr: false }
)

/* Upload panel */
import ModelUploadPanel, {
  UploadItem,
} from "@/components/viewers/ModelUploadPanel"

type ChatMessage = {
  id: string
  from: "user" | "assistant"
  text: string
}

export default function DashboardPage() {
  /* ---------------- Chat state ---------------- */
  const [messages, setMessages] = useState<ChatMessage[]>([])

  const handleSend = (text: string) => {
    setMessages((prev) => [
      ...prev,
      { id: crypto.randomUUID(), from: "user", text },
    ])
  }

  /* ---------------- Photogrammetry upload state ---------------- */
  const [files, setFiles] = useState<UploadItem[]>([])
  const [dragging, setDragging] = useState(false)

  function handleFiles(selected: File[]) {
    const newFiles: UploadItem[] = selected.map((file) => ({
      id: crypto.randomUUID(),
      file,
      processing: true,
    }))

    setFiles((prev) => [...prev, ...newFiles])

    newFiles.forEach((item) => {
      setTimeout(() => {
        setFiles((prev) =>
          prev.map((f) =>
            f.id === item.id ? { ...f, processing: false } : f
          )
        )
      }, 2000)
    })
  }

  function removeFile(id: string) {
    setFiles((prev) => prev.filter((f) => f.id !== id))
  }
  
    useEffect(() => {
    const projectId = localStorage.getItem("projectId");

    if (!projectId) return;

    const runPipeline = async () => {
      try {
        /* -------- 1. ANALYZE -------- */
        const analyzeRes = await fetch(
          `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/analyze`,
          { method: "POST" }
        );

        if (!analyzeRes.ok) {
          throw new Error("Analysis failed");
        }

        const analyzeData = await analyzeRes.json();
        console.log("Analysis completed:", analyzeData);

        /* -------- 2. EVENT SUMMARY -------- */
        const summaryRes = await fetch(
          `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/event-summary`,
          { method: "POST" }
        );

        if (!summaryRes.ok) {
          throw new Error("Event summary failed");
        }

        const summaryData = await summaryRes.json();
        console.log("Event summary generated:", summaryData);

        /* -------- 3. REPORT -------- */
        const reportRes = await fetch(
          `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/report`,
          { method: "POST" }
        );

        if (!reportRes.ok) {
          throw new Error("Report generation failed");
        }

        const reportData = await reportRes.json();
        console.log("Report generated:", reportData);

        /* -------- PUSH REPORT TO CHAT -------- */
        if (reportData?.report) {
          setMessages((prev) => [
            ...prev,
            {
              id: crypto.randomUUID(),
              from: "assistant",
              text: reportData.report,
            },
          ]);
        }
      } catch (error) {
        console.error("Pipeline error:", error);

        setMessages((prev) => [
          ...prev,
          {
            id: crypto.randomUUID(),
            from: "assistant",
            text:
              "⚠️ Failed to generate full report. Please try again later.",
          },
        ]);
      }
    };

    runPipeline();
  }, []);


  /* ---------------- TEMP generated 3D models ---------------- */
  const [generatedModels] = useState<string[]>([
    "/3d/temp_3d.obj",
    "/3d/new_3d.obj",
    
  ])

  /* ---------------- 3D model preview ---------------- */
  const [modelUrl, setModelUrl] = useState<string | null>(null)

  return (
    <main className="min-h-screen bg-[#0b0a0b] flex justify-center p-8 text-white">
      <div className="w-full flex flex-col">
        <Tabs
          defaultValue="chat"
          onValueChange={() => setModelUrl(null)}
          className="flex flex-col items-center flex-1"
        >
          {/* TABS */}
          <TabsList className="bg-[#191918] border border-white/10 rounded-lg px-1">
            {[
              ["chat", "Chat"],
              ["incidents", "Incidents"],
              ["emergency", "Emergency Contacts"],
              ["reports", "Reports"],
              ["models", "3D Models"],
            ].map(([value, label]) => (
              <TabsTrigger
                key={value}
                value={value}
                className="text-white/70 hover:text-white data-[state=active]:bg-white data-[state=active]:text-black"
              >
                {label}
              </TabsTrigger>
            ))}
          </TabsList>

          {/* FRAME */}
          <div className="mt-6 flex-1 w-full rounded-xl border-2 border-dashed border-white/20 p-6 overflow-hidden">

            {/* CHAT */}
            <TabsContent value="chat" className="mt-0 h-full flex flex-col">
              <Conversation messages={messages} className="flex-1" />
              <div className="p-3">
                <ChatInput onSend={handleSend} />
              </div>
            </TabsContent>

            {/* INCIDENTS */}
            <TabsContent value="incidents" className="mt-0 h-full">
              <Card className="bg-transparent border-none">
                <CardHeader>
                  <CardTitle>Incidents</CardTitle>
                  <CardDescription className="text-white/60">
                    Manage reported disaster events
                  </CardDescription>
                </CardHeader>
                <CardContent className="text-sm text-white/70">
                  Incident list will appear here.
                </CardContent>
              </Card>
            </TabsContent>

            {/* EMERGENCY CONTACTS */}
            <TabsContent value="emergency" className="mt-0 h-full">
              <ContactCards data={contactCardsData} />
            </TabsContent>

            {/* REPORTS */}
            <TabsContent value="reports" className="mt-0 h-full">
              <Card className="bg-transparent border-none">
                <CardHeader>
                  <CardTitle>Reports</CardTitle>
                  <CardDescription className="text-white/60">
                    Generate and export reports
                  </CardDescription>
                </CardHeader>
                <CardContent className="text-sm text-white/70">
                  PDF / CSV export options.
                </CardContent>
              </Card>
            </TabsContent>

            {/* 3D MODELS – LEFT STACK + RIGHT PREVIEW */}
            <TabsContent value="models" className="mt-0 h-full">
              <div className="h-full grid grid-cols-10 gap-4">

                {/* LEFT – 20% (TOP: Upload, BOTTOM: Generated files) */}
                <div className="col-span-2 flex flex-col gap-4">

                  {/* Upload */}
                  <div className="flex-1">
                    <ModelUploadPanel
                      files={files}
                      dragging={dragging}
                      setDragging={setDragging}
                      onFiles={handleFiles}
                      onRemove={removeFile}
                    />
                  </div>

                  {/* Generated models list (TEMP) */}
                  <div className="border border-white/10 rounded-lg p-2 overflow-auto">
                    <p className="text-xs text-white/50 mb-2">
                      Generated 3D Models
                    </p>

                    {generatedModels.map((model) => (
                      <button
                        key={model}
                        onClick={() => setModelUrl(model)}
                        className="w-full text-left px-2 py-1 rounded text-xs text-white/80 hover:bg-white/10"
                      >
                        {model.split("/").pop()}
                      </button>
                    ))}
                  </div>

                </div>

                {/* RIGHT – 80% (Preview only) */}
                <div className="col-span-8 border border-white/10 rounded-lg overflow-hidden">
                  {modelUrl ? (
                    <ModelViewerOBJ
                      modelPath={modelUrl}
                      onClose={() => setModelUrl(null)}
                    />
                  ) : (
                    <div className="h-full flex items-center justify-center text-white/40 text-sm">
                      Select a 3D model to preview
                    </div>
                  )}
                </div>

              </div>
            </TabsContent>

          </div>
        </Tabs>
      </div>
    </main>
  )
}