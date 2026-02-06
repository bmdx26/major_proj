"use client";

import { Loader2 } from "lucide-react";

export default function FullscreenLoader({ text }: { text?: string }) {
  return (
    <div className="fixed inset-0 z-50 bg-black/80 flex items-center justify-center">
      <div className="flex flex-col items-center gap-4">
        <Loader2 className="h-14 w-14 animate-spin text-white" />
        {text && <p className="text-sm text-white/70">{text}</p>}
      </div>
    </div>
  );
}