"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { ArrowRight, Shield } from "lucide-react";

export default function LandingPage() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    // Placeholder: check login state from localStorage
    const token = localStorage.getItem("authToken");
    setIsLoggedIn(!!token);
  }, []);

  return (
    <div className="relative flex min-h-screen flex-col items-center justify-center bg-[#0a0a0a] text-white overflow-hidden">
      {/* Subtle grid background */}
      <div
        className="pointer-events-none absolute inset-0 opacity-[0.03]"
        style={{
          backgroundImage:
            "linear-gradient(white 1px, transparent 1px), linear-gradient(90deg, white 1px, transparent 1px)",
          backgroundSize: "64px 64px",
        }}
      />

      {/* Radial glow */}
      <div className="pointer-events-none absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 h-[600px] w-[600px] rounded-full bg-white/[0.02] blur-3xl" />

      {/* Content */}
      <div className="relative z-10 flex flex-col items-center gap-8 px-6 text-center max-w-2xl">
        {/* Icon */}
        <div className="flex items-center justify-center rounded-full border border-white/10 bg-white/5 p-4">
          <Shield className="size-8 text-white/80" />
        </div>

        {/* Heading */}
        <h1 className="text-5xl font-bold tracking-tight sm:text-6xl">
          Disaster&nbsp;
          <span className="text-white/50">Response</span>
        </h1>

        {/* Subtext */}
        <p className="max-w-md text-base leading-relaxed text-white/40">
          Real-time coordination, 3D reconstruction, and intelligent analysis
          for rapid disaster assessment and recovery.
        </p>

        {/* Buttons */}
        <div className="mt-4 flex items-center gap-4">
          <Link href="/about">
            <Button
              variant="outline"
              size="lg"
              className="border-white/10 bg-transparent text-white hover:bg-white/5 hover:text-white cursor-pointer"
            >
              About Us
            </Button>
          </Link>

          <Link href={isLoggedIn ? "/dashboard" : "/login"}>
            <Button
              size="lg"
              className="bg-white text-black hover:bg-white/90 cursor-pointer"
            >
              {isLoggedIn ? "Dashboard" : "Login"}
              <ArrowRight className="ml-1 size-4" />
            </Button>
          </Link>
        </div>
      </div>

      {/* Bottom line accent */}
      <div className="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-white/10 to-transparent" />
    </div>
  );
}
