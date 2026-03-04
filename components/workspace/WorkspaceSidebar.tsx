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
  LayoutDashboard,
  KeyRound,
  Copy,
  Check,
  Loader2,
  MessagesSquare,
} from "lucide-react";
import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { useWorkspace, type WorkspaceTab } from "./WorkspaceContext";
import { fetchJoinCode, fetchMyRoleInfo } from "@/lib/api";
import type { MemberRole } from "@/lib/api";

const NAV_ITEMS: { value: WorkspaceTab; label: string; icon: typeof MessageSquare }[] = [
  { value: "chat",         label: "Chat",           icon: MessageSquare },
  { value: "community",    label: "Community",      icon: MessagesSquare },
  { value: "upload more",  label: "Upload",         icon: Upload },
  { value: "emergency",    label: "Emergency",      icon: ShieldAlert },
  { value: "reports",      label: "Reports",        icon: FileText },
  { value: "models",       label: "Models",         icon: Box },
  { value: "location",     label: "Location",       icon: MapPin },
  { value: "requests",     label: "Requests",       icon: Inbox },
  { value: "members",      label: "Members",        icon: UsersRound },
];

export default function WorkspaceSidebar() {
  const { activeTab, setActiveTab } = useWorkspace();
  const [collapsed, setCollapsed] = useState(false);
  const router = useRouter();

  /* Current user's role */
  const [myRole, setMyRole] = useState<MemberRole>("member");
  useEffect(() => {
    const projectId = localStorage.getItem("projectId");
    if (!projectId) return;
    (async () => {
      const info = await fetchMyRoleInfo(projectId);
      if (info) setMyRole(info.role.toLowerCase() as MemberRole);
    })();
  }, []);

  /* Filter nav items based on role */
  const visibleNavItems = NAV_ITEMS.filter((item) => {
    if (item.value === "requests" && myRole === "member") return false;
    return true;
  });

  /* Project code state */
  const [joinCode, setJoinCode] = useState<string | null>(null);
  const [codeLoading, setCodeLoading] = useState(false);
  const [copied, setCopied] = useState(false);

  async function handleGetCode() {
    const projectId = localStorage.getItem("projectId");
    if (!projectId) return;
    setCodeLoading(true);
    const code = await fetchJoinCode(projectId);
    setJoinCode(code);
    setCodeLoading(false);
  }

  async function handleCopy() {
    if (!joinCode) return;
    await navigator.clipboard.writeText(joinCode);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  }

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
        {visibleNavItems.map(({ value, label, icon: Icon }) => {
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

      {/* Project Code section */}
      <div className="border-t border-white/10 px-3 py-3">
        {!collapsed ? (
          <div className="flex flex-col gap-2">
            <span className="text-[11px] uppercase tracking-wider text-white/30">
              Project Code
            </span>
            {joinCode ? (
              <div className="flex items-center gap-1.5">
                <span className="flex-1 rounded-md bg-white/5 border border-white/10 px-2 py-1.5 text-xs font-mono text-white/80 truncate">
                  {joinCode}
                </span>
                <button
                  onClick={handleCopy}
                  className="shrink-0 p-1.5 rounded-md text-white/40 hover:text-white hover:bg-white/10 transition"
                  title="Copy code"
                >
                  {copied ? (
                    <Check className="h-3.5 w-3.5 text-green-400" />
                  ) : (
                    <Copy className="h-3.5 w-3.5" />
                  )}
                </button>
              </div>
            ) : (
              <button
                onClick={handleGetCode}
                disabled={codeLoading}
                className="flex items-center justify-center gap-1.5 w-full rounded-md border border-white/10 bg-white/5 px-2 py-1.5 text-xs text-white/60 hover:text-white hover:bg-white/10 transition disabled:opacity-40"
              >
                {codeLoading ? (
                  <Loader2 className="h-3 w-3 animate-spin" />
                ) : (
                  <KeyRound className="h-3 w-3" />
                )}
                Get Code
              </button>
            )}
          </div>
        ) : (
          <button
            onClick={handleGetCode}
            disabled={codeLoading}
            className="w-full flex items-center justify-center p-1.5 rounded-md text-white/40 hover:text-white hover:bg-white/5 transition"
            title="Get Project Code"
          >
            {codeLoading ? (
              <Loader2 className="h-4 w-4 animate-spin" />
            ) : (
              <KeyRound className="h-4 w-4" />
            )}
          </button>
        )}
      </div>

      {/* Go to Dashboard button */}
      <div className="border-t border-white/10 px-3 py-3">
        <button
          onClick={() => router.push("/dashboard")}
          title={collapsed ? "Go to Dashboard" : undefined}
          className={`
            flex items-center gap-2 w-full rounded-lg px-3 py-2
            text-sm text-white/60 hover:text-white hover:bg-white/5 transition cursor-pointer
            ${collapsed ? "justify-center px-0" : ""}
          `}
        >
          <LayoutDashboard className="h-4 w-4 shrink-0" />
          {!collapsed && <span>Go to Dashboard</span>}
        </button>
      </div>
    </aside>
  );
}
