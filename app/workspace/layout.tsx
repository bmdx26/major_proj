export const dynamic = 'force-dynamic'
export const runtime = 'nodejs'
import "leaflet/dist/leaflet.css";
import { WorkspaceLayoutShell } from "./WorkspaceLayoutShell";

export default function WorkspaceLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return <WorkspaceLayoutShell>{children}</WorkspaceLayoutShell>;
}
