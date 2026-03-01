"use client";

import "leaflet/dist/leaflet.css";
import MapViewer from "@/components/viewers/MapViewer";

export default function LocationPage() {
  return (
    <main style={{ height: "100vh", width: "100%" }}>
      <MapViewer />
    </main>
  );
}