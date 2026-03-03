import { getAuthHeaders } from "@/lib/utils";

const API = process.env.NEXT_PUBLIC_BACKENED_DOMAIN;

/* ─────────── API FUNCTIONS ─────────── */

/** POST /users/update — save user profile (name & designation) */
export async function updateUserProfile(
  name: string,
  designation: string
): Promise<boolean> {
  try {
    const res = await fetch(`${API}/users/update`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json", ...getAuthHeaders() },
      body: JSON.stringify({ name, designation }),
    });
    console.log("updateUserProfile response:", res);
    return res.ok;
  } catch {
    return false;
  }
}
