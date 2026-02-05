"use client"

import { ArrowDownIcon } from "lucide-react"
import type { ComponentProps } from "react"
import { useCallback } from "react"
import { StickToBottom, useStickToBottomContext } from "use-stick-to-bottom"
import { Button } from "~/components/ui/button"
import { cn } from "~/lib/utils"
import { Message, MessageContent } from "~/packages/ai/message"

export type ChatMessage = {
  id: string
  from: "user" | "assistant"
  text: string
}

export type ConversationProps = ComponentProps<typeof StickToBottom> & {
  messages: ChatMessage[]
}

export const Conversation = ({ className, messages, ...props }: ConversationProps) => (
  <StickToBottom
    className={cn("relative flex-1 overflow-y-hidden", className)}
    initial="smooth"
    resize="smooth"
    role="log"
    {...props}
  >
    <StickToBottom.Content className="flex flex-col gap-8 p-4">
      {messages.map((msg) => (
        <Message from={msg.from} key={msg.id}>
          <MessageContent>{msg.text}</MessageContent>
        </Message>
      ))}
    </StickToBottom.Content>
    <ConversationScrollButton />
  </StickToBottom>
)

export const ConversationScrollButton = ({
  className,
  ...props
}: ComponentProps<typeof Button>) => {
  const { isAtBottom, scrollToBottom } = useStickToBottomContext()

  const handleScrollToBottom = useCallback(() => {
    scrollToBottom()
  }, [scrollToBottom])

  return (
    !isAtBottom && (
      <Button
        className={cn("absolute bottom-4 left-1/2 -translate-x-1/2 rounded-full", className)}
        onClick={handleScrollToBottom}
        size="icon"
        type="button"
        variant="outline"
        {...props}
      >
        <ArrowDownIcon className="size-4" />
      </Button>
    )
  )
}
