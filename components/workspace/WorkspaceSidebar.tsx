"use client";

import {
  MessageSquare,
  Upload,
  ShieldAlert,
  FileText,
  Box,
  MapPin,
  ChevronLeft,
  ChevronRight,
  Inbox,
  UsersRound,
} from "lucide-react";
import { useState } from "react";
import { useWorkspace, type WorkspaceTab } from "./WorkspaceContext";

const NAV_ITEMS: { value: WorkspaceTab; label: string; icon: typeof MessageSquare }[] = [
  { value: "chat",         label: "Chat",        icon: MessageSquare },
  { value: "upload more",  label: "Upload",      icon: Upload },
  { value: "emergency",    label: "Emergency",   icon: ShieldAlert },
  { value: "reports",      label: "Reports",     icon: FileText },
  { value: "models",       label: "Models",      icon: Box },
  { value: "location",     label: "Location",    icon: MapPin },
  { value: "requests",     label: "Requests",    icon: Inbox },
  { value: "members",      label: "Members",     icon: UsersRound },
];

export default function WorkspaceSidebar() {
  const { activeTab, setActiveTab } = useWorkspace();
  const [collapsed, setCollapsed] = useState(false);

  return (
    <aside
      className={`
        flex flex-col h-full
        bg-[#111011] border-r border-white/10
        transition-all duration-200 ease-in-out
        ${collapsed ? "w-[60px]" : "w-[200px]"}
      `}
    >
      {/* Header / collapse toggle */}
      <div className="flex items-center justify-between px-3 py-4 border-b border-white/10">
        {!collapsed && (
          <span className="text-sm font-medium text-white/70 truncate">
            Workspace
          </span>
        )}
        <button
          onClick={() => setCollapsed((c) => !c)}
          className="p-1 rounded-md text-white/40 hover:text-white hover:bg-white/5 transition"
          title={collapsed ? "Expand sidebar" : "Collapse sidebar"}
        >
          {collapsed ? (
            <ChevronRight className="h-4 w-4" />
          ) : (
            <ChevronLeft className="h-4 w-4" />
          )}
        </button>
      </div>

      {/* Navigation items */}
      <nav className="flex-1 flex flex-col gap-1 px-2 py-3">
        {NAV_ITEMS.map(({ value, label, icon: Icon }) => {
          const isActive = activeTab === value;
          return (
            <button
              key={value}
              onClick={() => setActiveTab(value)}
              title={collapsed ? label : undefined}
              className={`
                flex items-center gap-3 rounded-lg px-3 py-2.5
                text-sm transition-colors cursor-pointer
                ${
                  isActive
                    ? "bg-white text-black font-medium"
                    : "text-white/60 hover:text-white hover:bg-white/5"
                }
                ${collapsed ? "justify-center px-0" : ""}
              `}
            >
              <Icon className="h-4 w-4 shrink-0" />
              {!collapsed && <span className="truncate">{label}</span>}
            </button>
          );
        })}
      </nav>

      {/* Bottom slot — placeholder for future content (e.g. user avatar, settings) */}
      <div className="border-t border-white/10 px-3 py-3">
        {/* TODO: Add user info / settings link */}
      </div>
    </aside>
  );
}
