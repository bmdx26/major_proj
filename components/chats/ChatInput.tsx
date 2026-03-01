"use client"

import { useState } from "react"
import TextareaAutosize from "react-textarea-autosize"
import { Button } from "@/components/ui/button"

type ChatInputProps = {
  onSend: (text: string) => void
  disabled?: boolean
}

export function ChatInput({ onSend, disabled = false }: ChatInputProps) {
  const [value, setValue] = useState("")

  const send = () => {
    if (!value.trim() || disabled) return
    onSend(value)
    setValue("")
  }

  return (
    <div className="relative w-full">
      <TextareaAutosize
        value={value}
        onChange={(e) => setValue(e.target.value)}
        onKeyDown={(e) => {
          if (e.key === "Enter" && !e.shiftKey) {
            e.preventDefault()
            send()
          }
        }}
        disabled={disabled}
        className="w-full min-h-20 resize-none rounded-md bg-[#313130] px-4 pr-20 py-4 text-sm text-white outline-none disabled:opacity-50 disabled:cursor-not-allowed"
        placeholder={disabled ? "Waiting for response…" : "Send…"}
      />

      <Button
        type="button"
        onClick={send}
        disabled={disabled}
        className="absolute right-2 top-1/2 -translate-y-1/2 bg-white px-4 py-1.5 text-black hover:bg-neutral-200 disabled:opacity-50 disabled:cursor-not-allowed"
      >
        Send
      </Button>
    </div>
  )
}
