"use client"

import { ArrowDownIcon } from "lucide-react"
import type { ComponentProps } from "react"
import { useCallback } from "react"
import { StickToBottom, useStickToBottomContext } from "use-stick-to-bottom"
import { Button } from "@/components/ui/button"
import { cn } from "@/lib/utils"
import { Message, MessageContent } from "@/components/ai/message"

export type ChatMessage = {
  id: string
  from: "user" | "assistant"
  text: string
}

type ConversationProps = ComponentProps<typeof StickToBottom> & {
  messages: ChatMessage[]
}

export function Conversation({
  className,
  messages,
  ...props
}: ConversationProps) {
  return (
    <StickToBottom
      className={cn("relative flex-1 overflow-y-hidden", className)}
      initial="smooth"
      resize="smooth"
      role="log"
      {...props}
    >
      <StickToBottom.Content className="flex flex-col gap-2 p-4">
        {messages.length === 0 ? (
          <div className="flex flex-1 items-center justify-center text-sm text-muted-foreground">
            No messages yet
          </div>
        ) : (
          messages.map((msg) => (
            <Message key={msg.id} from={msg.from}>
              <MessageContent>{msg.text}</MessageContent>
            </Message>
          ))
        )}
      </StickToBottom.Content>

      <ConversationScrollButton />
    </StickToBottom>
  )
}

function ConversationScrollButton(
  props: ComponentProps<typeof Button>
) {
  const { isAtBottom, scrollToBottom } = useStickToBottomContext()

  const handleScrollToBottom = useCallback(() => {
    scrollToBottom()
  }, [scrollToBottom])

  if (isAtBottom) return null

  return (
    <Button
      {...props}
      className="absolute bottom-4 left-1/2 -translate-x-1/2 rounded-full"
      onClick={handleScrollToBottom}
      size="icon"
      variant="outline"
    >
      <ArrowDownIcon className="size-4" />
    </Button>
  )
}
