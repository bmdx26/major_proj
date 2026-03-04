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

/** PATCH /projects/:projectId/members/:userId/role */
export async function changeRole(
  projectId: string,
  userId: string,
  newRole: MemberRole
): Promise<boolean> {
  try {
    await axios.patch(
      `${API}/projects/${projectId}/members/${userId}/role`,
      { role: newRole.toUpperCase() },
      { headers: { "Content-Type": "application/json", ...getAuthHeaders() } }
    );
    return true;
  } catch {
    return false;
  }
}

/** DELETE /projects/:projectId/members/:userId */
export async function removeMember(
  projectId: string,
  userId: string
): Promise<boolean> {
  try {
    await axios.delete(
      `${API}/projects/${projectId}/members/${userId}`,
      { headers: { ...getAuthHeaders() } }
    );
    return true;
  } catch {
    return false;
  }
}

