"use client";

import { useState, DragEvent } from "react";
import dynamicImport from "next/dynamic";
import { useRouter } from "next/navigation";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import {
  ImageIcon,
  VideoIcon,
  MusicIcon,
  Loader2,
  X,
} from "lucide-react";
import axios from "axios";

const MapPicker = dynamicImport(() => import("@/components/MapPicker"), {
  ssr: false,
});

const fieldClass =
  "bg-[#191918] border-white/10 text-white placeholder:text-white/40 focus-visible:ring-1 focus-visible:ring-white/20";

type UploadItem = {
  id: string;
  file: File;
  processing: boolean;
};

function getFileIcon(type: string) {
  if (type.startsWith("image")) return ImageIcon;
  if (type.startsWith("video")) return VideoIcon;
  if (type.startsWith("audio")) return MusicIcon;
  return ImageIcon;
}

export default function InputScreen() {
  const router = useRouter();

  const [step, setStep] = useState(1);
  const [coords, setCoords] = useState("");
  const [place, setPlace] = useState("");
  const [files, setFiles] = useState<UploadItem[]>([]);
  const [dragging, setDragging] = useState(false);
  const [submitting, setSubmitting] = useState(false);

  

  const [title, setTitle] = useState("");
  const [disasterType, setDisasterType] = useState("");
  const [description, setDescription] = useState("");
  const [latitude, setLatitude] = useState<number | null>(null);
  const [longitude, setLongitude] = useState<number | null>(null);


  function handleFiles(selected: File[]) {
    const newFiles: UploadItem[] = selected.map((file) => ({
      id: crypto.randomUUID(),
      file,
      processing: true,
    }));

    setFiles((prev) => [...prev, ...newFiles]);

    newFiles.forEach((item) => {
      setTimeout(() => {
        setFiles((prev) =>
          prev.map((f) =>
            f.id === item.id ? { ...f, processing: false } : f
          )
        );
      }, 5000);
    });
  }

  function handleDrop(e: DragEvent<HTMLDivElement>) {
    e.preventDefault();
    setDragging(false);
    handleFiles(Array.from(e.dataTransfer.files));
  }

  function removeFile(id: string) {
    setFiles((prev) => prev.filter((f) => f.id !== id));
  }

  function handleSubmit() {
    setSubmitting(true);

    setTimeout(() => {
      router.push("/dashboard");
    }, 3500);
  }

  async function handleNext() {
    try {
      if (!latitude || !longitude) {
        alert("Please select a location on the map");
        return;
      }

      const payload = {
        title,
        location: place,
        latitude,
        longitude,
        disasterType,
      };

      const response = await axios.post(
        `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/`,
        payload,
        {
          headers: {
            "Content-Type": "application/json",
          },
        }
      );
      console.log("Post created:", response.data);
      localStorage.setItem("projectId", response.data.id);
      // move to step 2 only after successful POST
      setStep(2);
    } catch (error) {
      console.error("Post creation failed:", error);
      alert("Failed to create post. Please try again.");
    }
  }
    

  async function uploadFiles() {
  const projectId = localStorage.getItem("projectId");

  if (!projectId) {
    alert("Project ID not found");
    return;
  }

  if (files.length === 0) {
    alert("No files selected");
    return;
  }

  const formData = new FormData();

  files.forEach((item) => {
    formData.append("files", item.file); 
    // 👆 key name must match backend (files / media / attachments)
  });

  try {
    setSubmitting(true);

    const response = await fetch(
      `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/projects/${projectId}/upload`,
      {
        method: "POST",
        body: formData,
      }
    );

    if (!response.ok) {
      throw new Error("File upload failed");
    }

    const data = await response.json();
    console.log("Files uploaded:", data);

    router.push("/dashboard");
  } catch (error) {
    console.error("Upload error:", error);
    alert("Failed to upload files");
  } finally {
    setSubmitting(false);
  }
}


  return (
    <main className="min-h-screen bg-[#0b0a0b] flex items-center justify-center p-6">
      {/* SUBMIT SPINNER */}
      {submitting && (
        <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-black/70">
          <Loader2 className="h-12 w-12 animate-spin text-white" />
        </div>
      )}

      <div className="w-full max-w-md text-white overflow-hidden">
        <h1 className="text-4xl font-semibold text-center pb-6">
          Emergency Disaster Reporting
        </h1>
        <p className="text-sm text-white/60 text-center mb-6">
          Provide incident details and select the exact location
        </p>

        <div className="relative h-[760px]">

          {/* STEP 1 */}
          <div
            className={`absolute inset-0 transition-transform duration-500 ${
              step === 1 ? "translate-x-0" : "-translate-x-full"
            }`}
          >
            <div className="space-y-4">
              <Input
                placeholder="Project name"
                className={fieldClass}
                value={title}
                onChange={(e) => setTitle(e.target.value)}
              />

              <Input
                placeholder="Disaster type (Flood, Fire, Earthquake)"
                className={fieldClass}
                value={disasterType}
                onChange={(e) => setDisasterType(e.target.value)}
              />

              <Input
                placeholder="Coordinates"
                value={coords}
                readOnly
                className={fieldClass}
              />
              <Input
                placeholder="Location name"
                value={place}
                readOnly
                className={fieldClass}
              />

              <div className="h-64 w-full overflow-hidden rounded-lg border border-white/10">
                <MapPicker
                  onChange={(lat, lng, placeName) => {
                    setLatitude(lat);
                    setLongitude(lng);
                    setCoords(`${lat.toFixed(6)}, ${lng.toFixed(6)}`);
                    setPlace(placeName);
                  }}
                />

              </div>

              <Textarea
                placeholder="Describe the situation..."
                className={`${fieldClass} min-h-[120px]`}
                value={description}
                onChange={(e) => setDescription(e.target.value)}
              />


              <Button
                onClick={handleNext}
                className="w-full bg-white text-black hover:bg-white/90"
              >
                Next
              </Button>
            </div>
          </div>

          {/* STEP 2 */}
          <div
            className={`absolute inset-0 transition-transform duration-500 ${
              step === 2 ? "translate-x-0" : "translate-x-full"
            }`}
          >
            <div className="space-y-4">

              <div
                onDragOver={(e) => {
                  e.preventDefault();
                  setDragging(true);
                }}
                onDragLeave={() => setDragging(false)}
                onDrop={handleDrop}
                className={`border-2 border-dashed rounded-lg p-6 text-center cursor-pointer ${
                  dragging
                    ? "border-white bg-white/5"
                    : "border-white/20"
                }`}
              >
                <input
                  type="file"
                  multiple
                  hidden
                  id="fileUpload"
                  onChange={(e) =>
                    handleFiles(
                      e.target.files ? Array.from(e.target.files) : []
                    )
                  }
                />
                <label htmlFor="fileUpload" className="cursor-pointer">
                  <p className="text-sm">
                    Drag & drop images / audio / video here
                  </p>
                  <p className="text-xs text-white/50 mt-1">
                    or click to browse
                  </p>
                </label>
              </div>

              {files.length > 0 && (
                <div className="space-y-2">
                  {files.map((item) => {
                    const Icon = getFileIcon(item.file.type);

                    return (
                      <div
                        key={item.id}
                        className="flex items-center justify-between gap-3 rounded-md border border-white/10 bg-[#191918] px-3 py-2 text-sm"
                      >
                        <div className="flex items-center gap-3 min-w-0">
                          {item.processing ? (
                            <Loader2 className="h-4 w-4 animate-spin text-white/70" />
                          ) : (
                            <Icon className="h-4 w-4 text-white/70" />
                          )}
                          <span className="truncate text-white/80">
                            {item.file.name}
                          </span>
                        </div>

                        <button
                          onClick={() => removeFile(item.id)}
                          className="text-white/50 hover:text-white"
                        >
                          <X className="h-4 w-4" />
                        </button>
                      </div>
                    );
                  })}
                </div>
              )}

              <Button
                onClick={() => setStep(1)}
                variant="ghost"
                className="w-full border border-white/20"
              >
                Back
              </Button>

              <Button
                onClick={uploadFiles}
                className="w-full bg-white text-black hover:bg-white/90"
              >
                Submit
              </Button>
            </div>
          </div>

        </div>
      </div>
    </main>
  );
}
