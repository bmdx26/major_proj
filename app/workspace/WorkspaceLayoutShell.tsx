"use client";

import { WorkspaceProvider } from "@/components/workspace/WorkspaceContext";
import WorkspaceSidebar from "@/components/workspace/WorkspaceSidebar";

export function WorkspaceLayoutShell({ children }: { children: React.ReactNode }) {
  return (
    <WorkspaceProvider>
      <div className="flex h-screen bg-[#0b0a0b] text-white overflow-hidden">
        <WorkspaceSidebar />
        <main className="flex-1 overflow-auto">{children}</main>
      </div>
    </WorkspaceProvider>
  );
}
