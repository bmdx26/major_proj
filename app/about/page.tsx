"use client";

import Link from "next/link";
import { Button } from "@/components/ui/button";
import { ArrowLeft, Target, Radio, Box } from "lucide-react";

const features = [
  {
    icon: Target,
    title: "Rapid Assessment",
    description:
      "Quickly evaluate disaster-affected areas using satellite imagery and AI-driven analysis for immediate situational awareness.",
  },
  {
    icon: Box,
    title: "3D Reconstruction",
    description:
      "Generate detailed 3D models of impacted zones from uploaded media, enabling precise damage evaluation and planning.",
  },
  {
    icon: Radio,
    title: "Real-time Coordination",
    description:
      "Streamline communication between response teams with live maps, contact networks, and intelligent chat assistance.",
  },
];

export default function AboutPage() {
  return (
    <div className="relative flex min-h-screen flex-col bg-[#0a0a0a] text-white">
      {/* Subtle grid background */}
      <div
        className="pointer-events-none absolute inset-0 opacity-[0.03]"
        style={{
          backgroundImage:
            "linear-gradient(white 1px, transparent 1px), linear-gradient(90deg, white 1px, transparent 1px)",
          backgroundSize: "64px 64px",
        }}
      />

      {/* Top bar */}
      <nav className="relative z-10 flex items-center justify-between border-b border-white/5 px-8 py-4">
        <Link href="/">
          <Button
            variant="ghost"
            size="sm"
            className="text-white/60 hover:text-white hover:bg-white/5 cursor-pointer"
          >
            <ArrowLeft className="mr-1 size-4" />
            Back
          </Button>
        </Link>
        <span className="text-sm font-medium tracking-wide text-white/30">
          ABOUT
        </span>
      </nav>

      {/* Hero */}
      <section className="relative z-10 flex flex-col items-center gap-6 px-6 pt-24 pb-16 text-center">
        <h1 className="text-4xl font-bold tracking-tight sm:text-5xl">
          About&nbsp;<span className="text-white/50">Us</span>
        </h1>
        <p className="max-w-lg text-base leading-relaxed text-white/40">
          We build technology that accelerates disaster response. Our platform
          combines AI, 3D modelling, and real-time data to give first
          responders the tools they need when every second counts.
        </p>
      </section>

      {/* Features */}
      <section className="relative z-10 mx-auto grid max-w-4xl gap-6 px-6 pb-24 sm:grid-cols-3">
        {features.map((f) => (
          <div
            key={f.title}
            className="flex flex-col gap-4 rounded-xl border border-white/5 bg-white/[0.02] p-6"
          >
            <div className="flex items-center justify-center rounded-lg border border-white/10 bg-white/5 p-3 w-fit">
              <f.icon className="size-5 text-white/70" />
            </div>
            <h3 className="text-lg font-semibold">{f.title}</h3>
            <p className="text-sm leading-relaxed text-white/40">
              {f.description}
            </p>
          </div>
        ))}
      </section>

      {/* Bottom line accent */}
      <div className="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-white/10 to-transparent" />
    </div>
  );
}
