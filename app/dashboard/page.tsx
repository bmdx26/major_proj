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
import { Button } from "@/components/ui/button"

import {
  ContactCards,
  contactCardsData,
} from "@/components/contact_cards/ContactCards"

/* OBJ 3D viewer (client only) */
const ModelViewerOBJ = dynamic(
  () => import("@/components/viewers/ModelViewerOBJ"),
  { ssr: false }
)

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

  /* ---------------- 3D model state ---------------- */
  const [modelUrl, setModelUrl] = useState<string | null>(null)
  const fileInputRef = useRef<HTMLInputElement>(null)

  function handleModelSelect(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return
    setModelUrl(URL.createObjectURL(file))
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

            {/* 3D MODELS (OBJ ONLY) */}
            <TabsContent value="models" className="mt-0 h-full">
              <div className="h-full flex flex-col gap-4">
                {!modelUrl && (
                  <div className="flex flex-col items-center justify-center h-full gap-4">
                    <p className="text-white/60">
                      Select a 3D model (OBJ)
                    </p>

                    <input
                      ref={fileInputRef}
                      type="file"
                      accept=".obj"
                      hidden
                      onChange={handleModelSelect}
                    />

                    <Button
                      className="bg-white text-black"
                      onClick={() => fileInputRef.current?.click()}
                    >
                      Select 3D File
                    </Button>
                  </div>
                )}

                {modelUrl && (
                  <ModelViewerOBJ
                    modelPath={modelUrl}
                    onClose={() => setModelUrl(null)}
                  />
                )}
              </div>
            </TabsContent>

          </div>
        </Tabs>
      </div>
    </main>
  )
}
