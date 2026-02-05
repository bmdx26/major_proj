"use client"

import type { UIMessage } from "ai"
import type { ComponentProps, HTMLAttributes, ReactElement } from "react"

import { Button } from "@/components/ui/button"
import {
  ButtonGroup,
  ButtonGroupText,
} from "@/components/ui/button-group"
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from "@/components/ui/tooltip"
import { cn } from "@/lib/utils"
import { cjk } from "@streamdown/cjk"
import { code } from "@streamdown/code"
import { math } from "@streamdown/math"
import { mermaid } from "@streamdown/mermaid"
import {
  createContext,
  memo,
  useContext,
  useEffect,
  useMemo,
  useState,
} from "react"
import { Streamdown } from "streamdown"

import { ChatInput } from "@/components/chats/ChatInput"

/* ------------------------------------------------------------------ */
/* Message primitives (UNCHANGED)                                      */
/* ------------------------------------------------------------------ */

export type MessageProps = HTMLAttributes<HTMLDivElement> & {
  from: UIMessage["role"]
}

export const Message = ({ className, from, ...props }: MessageProps) => (
  <div
    className={cn(
      "group flex w-full max-w-[95%] flex-col gap-2",
      from === "user"
        ? "is-user ml-auto items-end"
        : "is-assistant items-start",
      className
    )}
    {...props}
  />
)

export type MessageContentProps = HTMLAttributes<HTMLDivElement>

export const MessageContent = ({
  children,
  className,
  ...props
}: MessageContentProps) => (
  <div
    className={cn(
      "flex w-fit max-w-full flex-col gap-2 text-sm",
      "group-[.is-user]:rounded-lg group-[.is-user]:bg-secondary group-[.is-user]:px-4 group-[.is-user]:py-3 group-[.is-user]:text-foreground",
      "group-[.is-assistant]:rounded-lg group-[.is-assistant]:bg-[#191819] group-[.is-assistant]:px-4 group-[.is-assistant]:py-3 group-[.is-assistant]:text-white",
      className
    )}
    {...props}
  >
    {children}
  </div>
)

export type MessageActionsProps = ComponentProps<"div">

export const MessageActions = ({
  className,
  children,
  ...props
}: MessageActionsProps) => (
  <div className={cn("flex items-center gap-1", className)} {...props}>
    {children}
  </div>
)

export type MessageActionProps = ComponentProps<typeof Button> & {
  tooltip?: string
  label?: string
}

export const MessageAction = ({
  tooltip,
  children,
  label,
  variant = "ghost",
  size = "icon-sm",
  ...props
}: MessageActionProps) => {
  const button = (
    <Button size={size} type="button" variant={variant} {...props}>
      {children}
      <span className="sr-only">{label || tooltip}</span>
    </Button>
  )

  if (tooltip) {
    return (
      <TooltipProvider>
        <Tooltip>
          <TooltipTrigger asChild>{button}</TooltipTrigger>
          <TooltipContent>
            <p>{tooltip}</p>
          </TooltipContent>
        </Tooltip>
      </TooltipProvider>
    )
  }

  return button
}

/* ------------------------------------------------------------------ */
/* Branching (UNCHANGED)                                               */
/* ------------------------------------------------------------------ */

interface MessageBranchContextType {
  currentBranch: number
  totalBranches: number
  goToPrevious: () => void
  goToNext: () => void
  branches: ReactElement[]
  setBranches: (branches: ReactElement[]) => void
}

const MessageBranchContext = createContext<MessageBranchContextType | null>(null)

const useMessageBranch = () => {
  const context = useContext(MessageBranchContext)
  if (!context) throw new Error("Use inside MessageBranch")
  return context
}

export type MessageBranchProps = HTMLAttributes<HTMLDivElement> & {
  defaultBranch?: number
  onBranchChange?: (branchIndex: number) => void
}

export const MessageBranch = ({
  defaultBranch = 0,
  onBranchChange,
  className,
  ...props
}: MessageBranchProps) => {
  const [currentBranch, setCurrentBranch] = useState(defaultBranch)
  const [branches, setBranches] = useState<ReactElement[]>([])

  const handleBranchChange = (n: number) => {
    setCurrentBranch(n)
    onBranchChange?.(n)
  }

  return (
    <MessageBranchContext.Provider
      value={{
        branches,
        currentBranch,
        goToNext: () =>
          handleBranchChange(
            currentBranch < branches.length - 1 ? currentBranch + 1 : 0
          ),
        goToPrevious: () =>
          handleBranchChange(
            currentBranch > 0 ? currentBranch - 1 : branches.length - 1
          ),
        setBranches,
        totalBranches: branches.length,
      }}
    >
      <div className={cn("grid gap-2", className)} {...props} />
    </MessageBranchContext.Provider>
  )
}

export const MessageBranchContent = ({
  children,
}: HTMLAttributes<HTMLDivElement>) => {
  const { currentBranch, setBranches, branches } = useMessageBranch()
  const arr = useMemo(
    () => (Array.isArray(children) ? children : [children]),
    [children]
  )

  useEffect(() => {
    if (branches.length !== arr.length) setBranches(arr)
  }, [arr, branches, setBranches])

  return arr.map((branch, i) => (
    <div key={branch.key} className={i === currentBranch ? "block" : "hidden"}>
      {branch}
    </div>
  ))
}

export const MessageResponse = memo(
  ({ className, ...props }: ComponentProps<typeof Streamdown>) => (
    <Streamdown
      className={cn("size-full", className)}
      plugins={{ cjk, code, math, mermaid }}
      {...props}
    />
  )
)

MessageResponse.displayName = "MessageResponse"

/* ------------------------------------------------------------------ */
/* ✅ Conversation container (NEW)                                     */
/* ------------------------------------------------------------------ */

export default function ConversationDemo() {
  const [messages, setMessages] = useState<
    { id: string; role: "user"; content: string }[]
  >([])

  return (
    <div className="flex h-full flex-col">
      <div className="flex-1 space-y-4 overflow-y-auto p-4">
        {messages.map((m) => (
          <Message key={m.id} from={m.role}>
            <MessageContent>{m.content}</MessageContent>
          </Message>
        ))}
      </div>

      <div className="p-3">
        <ChatInput
          onSend={(text) =>
            setMessages((prev) => [
              ...prev,
              {
                id: crypto.randomUUID(),
                role: "user",
                content: text,
              },
            ])
          }
        />
      </div>
    </div>
  )
}
