import { getAuthHeaders } from "@/lib/utils";

const API = process.env.NEXT_PUBLIC_BACKENED_DOMAIN;

/* ─────────── TYPES ─────────── */

export type MemberRole = "creator" | "coordinator" | "member";

export type ProjectMember = {
  id: string;
  userId: string;
  userName: string;
  userDesignation: string;
  role: MemberRole;
};

/* ─────────── API FUNCTIONS ─────────── */

/** GET /projects/:projectId/members */
export async function fetchProjectMembers(
  projectId: string
): Promise<ProjectMember[]> {
  try {
    const res = await fetch(`${API}/projects/${projectId}/members`, {
      headers: { ...getAuthHeaders() },
    });
    if (!res.ok) return [];
    return await res.json();
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
      headers: { ...getAuthHeaders() },
    });
    if (!res.ok) return "member";
    const data = await res.json();
    return data.role ?? "member";
  } catch {
    return "member";
  }
}
