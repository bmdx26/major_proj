"use client";

import { createContext, useContext, useState, type ReactNode } from "react";

export type WorkspaceTab =
  | "chat"
  | "community"
  | "upload more"
  | "emergency"
  | "reports"
  | "models"
  | "location"
  | "requests"
  | "members";

type WorkspaceContextValue = {
  activeTab: WorkspaceTab;
  setActiveTab: (tab: WorkspaceTab) => void;
};

const WorkspaceContext = createContext<WorkspaceContextValue | null>(null);

export function WorkspaceProvider({ children }: { children: ReactNode }) {
  const [activeTab, setActiveTab] = useState<WorkspaceTab>("chat");

  return (
    <WorkspaceContext.Provider value={{ activeTab, setActiveTab }}>
      {children}
    </WorkspaceContext.Provider>
  );
}

export function useWorkspace() {
  const ctx = useContext(WorkspaceContext);
  if (!ctx) throw new Error("useWorkspace must be used within WorkspaceProvider");
  return ctx;
}
