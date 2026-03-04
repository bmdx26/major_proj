"use client";

import { useState, useEffect, useMemo } from "react";
import { useRouter } from "next/navigation";
import {
  Search,
  Plus,
  Filter,
  UserCircle,
  Clock,
  CheckCircle2,
  XCircle,
  X,
  Loader2,
  FolderOpen,
  Users,
  Send,
  LogOut,
  KeyRound,
} from "lucide-react";
import {
  fetchMyProjects,
  fetchJoinedProjects,
  fetchMyRequests,
  searchProjects,
  sendJoinRequestByCode,
  cancelJoinRequest,
  fetchCurrentUser,
} from "@/lib/api";
import type {
  Project,
  JoinedProject,
  JoinRequest,
  SearchResult,
} from "@/lib/api";

/* ──────────────── STATUS BADGE ──────────────── */

function StatusBadge({ status }: { status: JoinRequest["status"] }) {
  const key = status.toLowerCase() as "pending" | "accepted" | "rejected";
  const config = {
    pending: {
      icon: Clock,
      label: "Pending",
      cls: "bg-yellow-500/15 text-yellow-400 border-yellow-500/20",
    },
    accepted: {
      icon: CheckCircle2,
      label: "Accepted",
      cls: "bg-green-500/15 text-green-400 border-green-500/20",
    },
    rejected: {
      icon: XCircle,
      label: "Rejected",
      cls: "bg-red-500/15 text-red-400 border-red-500/20",
    },
  }[key];

  if (!config) return null;
  const Icon = config.icon;

  return (
    <span
      className={`inline-flex items-center gap-1 rounded-full border px-2.5 py-0.5 text-[11px] font-medium ${config.cls}`}
    >
      <Icon className="h-3 w-3" />
      {config.label}
    </span>
  );
}

/* ──────────── SECTION FILTER INPUT ──────────── */

function SectionFilter({
  value,
  onChange,
  open,
  onToggle,
}: {
  value: string;
  onChange: (v: string) => void;
  open: boolean;
  onToggle: () => void;
}) {
  return (
    <div className="flex items-center gap-2">
      {open && (
        <input
          autoFocus
          value={value}
          onChange={(e) => onChange(e.target.value)}
          placeholder="Filter…"
          className="h-7 w-36 rounded-md border border-white/10 bg-[#191918] px-2 text-xs text-white placeholder:text-white/30 outline-none focus:border-white/20"
        />
      )}
      <button
        onClick={onToggle}
        className="p-1 rounded-md text-white/40 hover:text-white hover:bg-white/5 transition"
        title="Filter"
      >
        <Filter className="h-3.5 w-3.5" />
      </button>
    </div>
  );
}

/* ─────────────────── PAGE ─────────────────── */

export default function DashboardPage() {
  const router = useRouter();

  /* ── User info ── */
  const [userName, setUserName] = useState("");
  const [userDesignation, setUserDesignation] = useState("");

  /* ── Data ── */
  const [myProjects, setMyProjects] = useState<Project[]>([]);
  const [joinedProjects, setJoinedProjects] = useState<JoinedProject[]>([]);
  const [myRequests, setMyRequests] = useState<JoinRequest[]>([]);
  const [loading, setLoading] = useState(true);

  /* ── Search ── */
  const [searchQuery, setSearchQuery] = useState("");
  const [searchResults, setSearchResults] = useState<SearchResult[]>([]);
  const [searching, setSearching] = useState(false);
  const [selectedSearchProject, setSelectedSearchProject] = useState<SearchResult | null>(null);
  const [joining, setJoining] = useState(false);

  /* ── Join by code popup ── */
  const [joinCodeOpen, setJoinCodeOpen] = useState(false);
  const [joinCodeValue, setJoinCodeValue] = useState("");
  const [joinCodeLoading, setJoinCodeLoading] = useState(false);

  /* ── Logout popup ── */
  const [logoutOpen, setLogoutOpen] = useState(false);

  /* ── Section filters ── */
  const [filterMyOpen, setFilterMyOpen] = useState(false);
  const [filterMyQuery, setFilterMyQuery] = useState("");

  const [filterJoinedOpen, setFilterJoinedOpen] = useState(false);
  const [filterJoinedQuery, setFilterJoinedQuery] = useState("");

  const [filterReqOpen, setFilterReqOpen] = useState(false);
  const [filterReqQuery, setFilterReqQuery] = useState("");



  /* ── Cancelling request ── */
  const [cancellingId, setCancellingId] = useState<string | null>(null);

  /* ────── LOAD DATA ON MOUNT ────── */


  useEffect(() => {
const params = new URLSearchParams(window.location.search);
    const token = params.get("token");
    if (token) {
      localStorage.setItem("authToken", token);
      // Clean the URL
      window.history.replaceState({}, "", "/login");
      
    }

    async function load() {
      setLoading(true);
      const [projects, joined, requests, me] = await Promise.all([
        fetchMyProjects(),
        fetchJoinedProjects(),
        fetchMyRequests(),
        fetchCurrentUser(),
      ]);
      setMyProjects(projects);
      setJoinedProjects(joined);
      setMyRequests(requests);

      if (me) {
        setUserName(me.name || "User");
        setUserDesignation(me.designation || "Member");
        localStorage.setItem("userName", me.name || "User");
        localStorage.setItem("userDesignation", me.designation || "Member");
      } else {
        setUserName(localStorage.getItem("userName") || "User");
        setUserDesignation(localStorage.getItem("userDesignation") || "Member");
      }

      setLoading(false);
    }
    load();
  }, []);

  /* ────── SEARCH DEBOUNCE ────── */

  useEffect(() => {
    if (!searchQuery.trim()) {
      setSearchResults([]);
      setSelectedSearchProject(null);
      return;
    }

    const timeout = setTimeout(async () => {
      setSearching(true);
      const results = await searchProjects(searchQuery);
      setSearchResults(results);
      setSearching(false);
    }, 400);

    return () => clearTimeout(timeout);
  }, [searchQuery]);

  /* ────── ACTIONS ────── */

  function handleOpenProject(projectId: string) {
    localStorage.setItem("projectId", projectId);
    // Find project from already-fetched data
    const project =
      myProjects.find((p) => p.id === projectId) ??
      joinedProjects.find((p) => p.id === projectId);
    if (project) {
      localStorage.setItem("projectName", project.title);
    }
    if (project?.latitude != null && project?.longitude != null) {
      localStorage.setItem("projectLat", String(project.latitude));
      localStorage.setItem("projectLng", String(project.longitude));
    }
    router.push("/workspace");
  }

  async function handleJoinProject() {
    if (!selectedSearchProject) return;
    setJoining(true);
    const ok = await sendJoinRequestByCode("");
    if (ok) {
      const requests = await fetchMyRequests();
      setMyRequests(requests);
      setSearchQuery("");
      setSearchResults([]);
      setSelectedSearchProject(null);
    } else {
      alert("Failed to send join request.");
    }
    setJoining(false);
  }

  async function handleJoinByCode() {
    if (!joinCodeValue.trim()) return;
    setJoinCodeLoading(true);
    const ok = await sendJoinRequestByCode(joinCodeValue.trim());
    if (ok) {
      const requests = await fetchMyRequests();
      setMyRequests(requests);
      setJoinCodeValue("");
      setJoinCodeOpen(false);
    } else {
      alert("Invalid code or failed to join.");
    }
    setJoinCodeLoading(false);
  }

  function handleLogout() {
    localStorage.removeItem("authToken");
    localStorage.removeItem("userName");
    localStorage.removeItem("userDesignation");
    localStorage.removeItem("projectId");
    localStorage.removeItem("projectName");
    router.push("/login");
  }

  async function handleCancelRequest(requestId: string, projectId: string) {
    setCancellingId(requestId);
    const ok = await cancelJoinRequest(projectId);
    if (ok) {
      setMyRequests((prev) => prev.filter((r) => r.id !== requestId));
    } else {
      alert("Failed to cancel request.");
    }
    setCancellingId(null);
  }

  function handleCreateProject() {

    router.push("/input");
  }

  /* ────── FILTERED LISTS ────── */

  const filteredMyProjects = useMemo(
    () =>
      filterMyQuery
        ? myProjects.filter((p) =>
            p.title.toLowerCase().includes(filterMyQuery.toLowerCase())
          )
        : myProjects,
    [myProjects, filterMyQuery]
  );

  const filteredJoinedProjects = useMemo(
    () =>
      filterJoinedQuery
        ? joinedProjects.filter((p) =>
            p.title.toLowerCase().includes(filterJoinedQuery.toLowerCase())
          )
        : joinedProjects,
    [joinedProjects, filterJoinedQuery]
  );

  const filteredRequests = useMemo(
    () =>
      filterReqQuery
        ? myRequests.filter((r) =>
            r.projectTitle.toLowerCase().includes(filterReqQuery.toLowerCase())
          )
        : myRequests,
    [myRequests, filterReqQuery]
  );

  /* ────────────────── UI ────────────────── */

  return (
    <div className="min-h-screen bg-[#0b0a0b] text-white">
      {/* ══════════ HEADER ══════════ */}
      <header className="sticky top-0 z-30 border-b border-white/10 bg-[#0b0a0b]/80 backdrop-blur-md">
        <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-3">
          {/* Left — Profile card */}
          <div className="flex items-center gap-3">
            <div className="relative z-50">
              <button
                onClick={() => setLogoutOpen((o) => !o)}
                className="flex h-9 w-9 items-center justify-center rounded-full border border-white/10 bg-white/5 hover:bg-white/10 transition cursor-pointer"
                title="Account"
              >
                <UserCircle className="h-5 w-5 text-white/60" />
              </button>

              {/* Logout popup */}
              {logoutOpen && (
                <>
                  {/* Click-away backdrop */}
                  <div
                    className="fixed inset-0 z-40"
                    onClick={() => setLogoutOpen(false)}
                  />
                  <div className="absolute left-0 top-full mt-2 w-56 rounded-lg border border-white/10 bg-[#191918] shadow-xl z-50 p-3">
                    <div className="mb-3">
                      <p className="text-sm font-medium text-white">{userName}</p>
                      <p className="text-[11px] text-white/40">{userDesignation}</p>
                    </div>
                    <div className="border-t border-white/10 pt-2">
                      <button
                        onClick={handleLogout}
                        className="flex w-full items-center gap-2 rounded-md px-2 py-1.5 text-sm text-red-400 hover:bg-red-500/10 transition"
                      >
                        <LogOut className="h-4 w-4" />
                        Logout
                      </button>
                    </div>
                  </div>
                </>
              )}
            </div>
            <div className="leading-tight">
              <p className="text-sm font-medium text-white">{userName}</p>
              <p className="text-[11px] text-white/40">{userDesignation}</p>
            </div>
          </div>

          {/* Right — Search + Join + Create */}
          <div className="flex items-center gap-3">
            {/* Search box */}
            <div className="relative">
              <div className="flex items-center gap-1 rounded-lg border border-white/10 bg-[#191918] px-3 py-1.5">
                <Search className="h-3.5 w-3.5 text-white/30" />
                <input
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  placeholder="Search for projects…"
                  className="w-52 bg-transparent text-sm text-white placeholder:text-white/30 outline-none"
                />
                {searching && (
                  <Loader2 className="h-3.5 w-3.5 animate-spin text-white/40" />
                )}
              </div>

              {/* Search dropdown */}
              {searchResults.length > 0 && (
                <div className="absolute top-full left-0 mt-1 w-full rounded-lg border border-white/10 bg-[#191918] shadow-xl z-50 max-h-52 overflow-auto">
                  {searchResults.map((result) => (
                    <button
                      key={result.id}
                      onClick={() => setSelectedSearchProject(result)}
                      className={`w-full text-left px-3 py-2 text-sm transition ${
                        selectedSearchProject?.id === result.id
                          ? "bg-white/10 text-white"
                          : "text-white/70 hover:bg-white/5 hover:text-white"
                      }`}
                    >
                      {result.title}
                    </button>
                  ))}
                </div>
              )}
            </div>

            {/* Join button */}
            <button
              onClick={() => setJoinCodeOpen(true)}
              className="flex items-center gap-1.5 rounded-lg border border-white/10 bg-[#191918] px-4 py-1.5 text-sm text-white/80 hover:bg-white/5 hover:text-white transition"
            >
              <KeyRound className="h-3.5 w-3.5" />
              Join Project
            </button>

            {/* Create Project */}
            <button
              onClick={handleCreateProject}
              className="flex items-center gap-1.5 rounded-lg bg-white px-4 py-1.5 text-sm font-medium text-black hover:bg-white/90 transition cursor-pointer"
            >
              <Plus className="h-4 w-4" />
              Create Project
            </button>
          </div>
        </div>
      </header>

      {/* ══════════ MAIN ══════════ */}
      <main className="mx-auto max-w-7xl px-6 py-8">
        {loading ? (
          <div className="flex items-center justify-center py-32">
            <Loader2 className="h-8 w-8 animate-spin text-white/40" />
          </div>
        ) : (
          <div className="grid grid-cols-1 gap-6 lg:grid-cols-3">
            {/* ── COLUMN 1 — My Projects ── */}
            <section className="flex flex-col rounded-xl border border-white/10 bg-[#111011]">
              {/* Section header */}
              <div className="flex items-center justify-between border-b border-white/10 px-4 py-3">
                <div className="flex items-center gap-2">
                  <FolderOpen className="h-4 w-4 text-white/50" />
                  <h2 className="text-sm font-medium text-white/80">
                    My Projects
                  </h2>
                </div>
                <SectionFilter
                  value={filterMyQuery}
                  onChange={setFilterMyQuery}
                  open={filterMyOpen}
                  onToggle={() => {
                    setFilterMyOpen((o) => !o);
                    if (filterMyOpen) setFilterMyQuery("");
                  }}
                />
              </div>

              {/* List */}
              <div className="flex-1 overflow-auto p-2" style={{ maxHeight: "calc(100vh - 260px)" }}>
                {filteredMyProjects.length === 0 ? (
                  <p className="py-10 text-center text-xs text-white/25">
                    {filterMyQuery ? "No matching projects" : "No projects yet"}
                  </p>
                ) : (
                  <div className="space-y-1">
                    {filteredMyProjects.map((project) => (
                      <button
                        key={project.id}
                        onClick={() => handleOpenProject(project.id)}
                        className="w-full text-left rounded-lg px-3 py-2.5 text-sm text-white/70 hover:bg-white/5 hover:text-white transition"
                      >
                        {project.title}
                      </button>
                    ))}
                  </div>
                )}
              </div>
            </section>

            {/* ── COLUMN 2 — Joined Projects ── */}
            <section className="flex flex-col rounded-xl border border-white/10 bg-[#111011]">
              {/* Section header */}
              <div className="flex items-center justify-between border-b border-white/10 px-4 py-3">
                <div className="flex items-center gap-2">
                  <Users className="h-4 w-4 text-white/50" />
                  <h2 className="text-sm font-medium text-white/80">
                    Joined Projects
                  </h2>
                </div>
                <SectionFilter
                  value={filterJoinedQuery}
                  onChange={setFilterJoinedQuery}
                  open={filterJoinedOpen}
                  onToggle={() => {
                    setFilterJoinedOpen((o) => !o);
                    if (filterJoinedOpen) setFilterJoinedQuery("");
                  }}
                />
              </div>

              {/* List */}
              <div className="flex-1 overflow-auto p-2" style={{ maxHeight: "calc(100vh - 260px)" }}>
                {filteredJoinedProjects.length === 0 ? (
                  <p className="py-10 text-center text-xs text-white/25">
                    {filterJoinedQuery
                      ? "No matching projects"
                      : "No joined projects"}
                  </p>
                ) : (
                  <div className="space-y-1">
                    {filteredJoinedProjects.map((project) => (
                      <button
                        key={project.id}
                        onClick={() => handleOpenProject(project.id)}
                        className="w-full flex items-center justify-between rounded-lg px-3 py-2.5 text-sm hover:bg-white/5 transition"
                      >
                        <span className="text-white/70 hover:text-white truncate">
                          {project.title}
                        </span>
                        <span className="ml-2 shrink-0 rounded-full border border-white/10 bg-white/5 px-2.5 py-0.5 text-[11px] text-white/40">
                          {project.role}
                        </span>
                      </button>
                    ))}
                  </div>
                )}
              </div>
            </section>

            {/* ── COLUMN 3 — My Requests ── */}
            <section className="flex flex-col rounded-xl border border-white/10 bg-[#111011]">
              {/* Section header */}
              <div className="flex items-center justify-between border-b border-white/10 px-4 py-3">
                <div className="flex items-center gap-2">
                  <Send className="h-4 w-4 text-white/50" />
                  <h2 className="text-sm font-medium text-white/80">
                    My Requests
                  </h2>
                </div>
                <SectionFilter
                  value={filterReqQuery}
                  onChange={setFilterReqQuery}
                  open={filterReqOpen}
                  onToggle={() => {
                    setFilterReqOpen((o) => !o);
                    if (filterReqOpen) setFilterReqQuery("");
                  }}
                />
              </div>

              {/* List */}
              <div className="flex-1 overflow-auto p-2" style={{ maxHeight: "calc(100vh - 260px)" }}>
                {filteredRequests.length === 0 ? (
                  <p className="py-10 text-center text-xs text-white/25">
                    {filterReqQuery
                      ? "No matching requests"
                      : "No requests sent"}
                  </p>
                ) : (
                  <div className="space-y-1">
                    {filteredRequests.map((req) => (
                      <div
                        key={req.id}
                        className="flex items-center justify-between gap-2 rounded-lg px-3 py-2.5 hover:bg-white/5 transition"
                      >
                        <span className="text-sm text-white/70 truncate">
                          {req.projectTitle}
                        </span>
                        <div className="flex items-center gap-2 shrink-0">
                          <StatusBadge status={req.status} />
                          <button
                            onClick={() => handleCancelRequest(req.id, req.projectId)}
                            disabled={cancellingId === req.id}
                            className="p-1 rounded-md text-white/30 hover:text-red-400 hover:bg-red-500/10 transition disabled:opacity-40"
                            title="Cancel request"
                          >
                            {cancellingId === req.id ? (
                              <Loader2 className="h-3.5 w-3.5 animate-spin" />
                            ) : (
                              <X className="h-3.5 w-3.5" />
                            )}
                          </button>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            </section>
          </div>
        )}
      </main>

      {/* ══════════ JOIN BY CODE MODAL ══════════ */}
      {joinCodeOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm">
          <div className="w-full max-w-sm rounded-xl border border-white/10 bg-[#191918] p-6 shadow-2xl">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-sm font-medium text-white">Join Project</h3>
              <button
                onClick={() => { setJoinCodeOpen(false); setJoinCodeValue(""); }}
                className="p-1 rounded-md text-white/40 hover:text-white hover:bg-white/5 transition"
              >
                <X className="h-4 w-4" />
              </button>
            </div>
            <p className="text-xs text-white/40 mb-3">Enter the project code shared by the project creator.</p>
            <input
              autoFocus
              value={joinCodeValue}
              onChange={(e) => setJoinCodeValue(e.target.value)}
              onKeyDown={(e) => e.key === "Enter" && handleJoinByCode()}
              placeholder="e.g. ABC123"
              className="w-full rounded-lg border border-white/10 bg-[#0b0a0b] px-3 py-2 text-sm text-white font-mono placeholder:text-white/30 outline-none focus:border-white/20 mb-4"
            />
            <button
              onClick={handleJoinByCode}
              disabled={!joinCodeValue.trim() || joinCodeLoading}
              className="w-full flex items-center justify-center gap-2 rounded-lg bg-white px-4 py-2 text-sm font-medium text-black hover:bg-white/90 transition disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {joinCodeLoading ? (
                <Loader2 className="h-4 w-4 animate-spin" />
              ) : (
                <Send className="h-3.5 w-3.5" />
              )}
              Request to Join
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
