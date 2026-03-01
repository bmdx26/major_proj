"use client";

import dynamic from "next/dynamic";

const MapViewer = dynamic(() => import("@/components/viewers/MapViewer"), {
  ssr: false,
});

export default function LocationPage() {
  return (
    <main style={{ height: "100vh", width: "100%" }}>
      <MapViewer />
    </main>
  );
}