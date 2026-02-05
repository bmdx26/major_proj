"use client";

type Props = {
  files: string[];
  active: string | null;
  onSelect: (file: string) => void;
};

export default function ModelFileList({
  files,
  active,
  onSelect,
}: Props) {
  return (
    <div className="border border-white/10 rounded-lg p-3 h-full overflow-auto">
      <p className="text-xs text-white/50 mb-2">
        Generated 3D Models
      </p>

      {files.length === 0 && (
        <p className="text-xs text-white/30">
          No models generated yet
        </p>
      )}

      <div className="space-y-2">
        {files.map((file) => (
          <button
            key={file}
            onClick={() => onSelect(file)}
            className={`w-full text-left px-3 py-2 rounded text-sm ${
              active === file
                ? "bg-white text-black"
                : "bg-[#191918] text-white/80 hover:bg-white/10"
            }`}
          >
            {file}
          </button>
        ))}
      </div>
    </div>
  );
}
