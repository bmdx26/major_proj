"use client";

import { useEffect, useState } from "react";
import { MapContainer, TileLayer, Marker, useMapEvents } from "react-leaflet";
import L from "leaflet";
const DEFAULT_POS: [number, number] = [10.231541, 76.408710];


// Fix marker icons
delete (L.Icon.Default.prototype as any)._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl:
    "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png",
  iconUrl:
    "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png",
  shadowUrl:
    "https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png",
});

function ClickHandler({
  onPick,
}: {
  onPick: (lat: number, lng: number) => void;
}) {
  useMapEvents({
    click(e) {
      onPick(e.latlng.lat, e.latlng.lng);
    },
  });
  return null;
}

export default function MapPicker({
  onChange,
}: {
  onChange: (lat: number, lng: number, place: string) => void;
}) {
  const [mounted, setMounted] = useState(false);
  const [pos, setPos] = useState<[number, number]>(DEFAULT_POS);

  useEffect(() => {
    setMounted(true);
  }, []);

  async function fetchPlace(lat: number, lng: number) {
    try {
      const res = await fetch(
        `https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}`
      );
      const data = await res.json();
      return data.display_name || "Unknown location";
    } catch {
      return "Unknown location";
    }
  }

  async function handleUseMyLocation() {
    if (!navigator.geolocation) {
      alert("Geolocation not supported");
      return;
    }

    navigator.geolocation.getCurrentPosition(
      async (pos) => {
        const lat = pos.coords.latitude;
        const lng = pos.coords.longitude;

        setPos([lat, lng]);
        const place = await fetchPlace(lat, lng);
        onChange(lat, lng, place);
      },
      () => alert("Location permission denied")
    );
  }

  if (!mounted) return null;

  return (
    <div className="relative h-full w-full">
      {/* Use my location button */}
      <button
        onClick={handleUseMyLocation}
        className="absolute left-3 top-3 z-[1000] rounded-md bg-black/70 px-3 py-1 text-xs text-white"
      >
        Use my location
      </button>

      <MapContainer
        key="leaflet-map"
        center={pos}
        zoom={17}
        scrollWheelZoom={false}
        className="h-full w-full"
      >
        <TileLayer
          url="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"
          attribution="Tiles © Esri"
        />

        <ClickHandler
          onPick={async (lat, lng) => {
            setPos([lat, lng]);
            const place = await fetchPlace(lat, lng);
            onChange(lat, lng, place);
          }}
        />

        <Marker position={pos} />
      </MapContainer>
    </div>
  );
}
