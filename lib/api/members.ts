import { getAuthHeaders } from "@/lib/utils";
import axios from "axios";

const API = process.env.NEXT_PUBLIC_BACKEND_DOMAIN;

/* ─────────── TYPES ─────────── */

export type MemberRole = "creator" | "coordinator" | "member";

export type ProjectMember = {
  id: string;
  userId: string;
  userName: string;
  userEmail: string;
  userDesignation: string;
  role: MemberRole;
  status: string;
};

/* ─────────── API FUNCTIONS ─────────── */

/** GET /projects/:projectId/members */
export async function fetchProjectMembers(
  projectId: string
): Promise<ProjectMember[]> {
  try {
    const res = await axios.get(`${API}/projects/${projectId}/members`, {
      headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() },
    });
    const raw = res.data;
    console.log("fetchProjectMembers raw:", raw);
    const list = Array.isArray(raw) ? raw : raw.members ?? raw.data ?? [];
    return list.map((m: { id: string; name: string; email: string; designation: string; role: string; status: string }) => ({
      id: m.id,
      userId: m.id,
      userName: m.name,
      userEmail: m.email,
      userDesignation: m.designation,
      role: m.role.toLowerCase() as MemberRole,
      status: m.status,
    }));
  } catch {
    return [];
  }
}

/** PATCH /projects/:projectId/members/:memberId/role */
export async function changeRole(
  projectId: string,
  memberId: string,
  newRole: MemberRole
): Promise<boolean> {
  try {
    const res = await fetch(
      `${API}/projects/${projectId}/members/${memberId}/role`,
      {
        method: "PATCH",
        headers: { "Content-Type": "application/json", ...getAuthHeaders() },
        body: JSON.stringify({ role: newRole }),
      }
    );
    return res.ok;
  } catch {
    return false;
  }
}

/** DELETE /projects/:projectId/members/:memberId */
export async function removeMember(
  projectId: string,
  memberId: string
): Promise<boolean> {
  try {
    const res = await fetch(
      `${API}/projects/${projectId}/members/${memberId}`,
      { method: "DELETE", headers: { ...getAuthHeaders() } }
    );
    return res.ok;
  } catch {
    return false;
  }
}

/** GET /projects/:projectId/my-role */
export async function fetchMyRole(
  projectId: string
): Promise<MemberRole> {
  try {
    const res = await fetch(`${API}/projects/${projectId}/my-role`, {
      headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() },
    });
    if (!res.ok) return "member";
    const data = await res.json();
    return data.role ?? "member";
  } catch {
    return "member";
  }
}
