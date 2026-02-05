import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

export type ContactCard = {
  title: string;
  subtitle?: string;
  content: string;
  actionLabel?: string;
  onAction?: () => void;
};

export const contactCardsData: ContactCard[] = [
  {
    title: "Ambulance",
    subtitle: "Emergency Medical",
    content: "📞 108",
    actionLabel: "Call",
  },
  {
    title: "Police",
    subtitle: "Law & Order",
    content: "📞 100",
    actionLabel: "Call",
  },
  {
    title: "Fire & Rescue",
    subtitle: "Fire Emergency",
    content: "📞 101",
    actionLabel: "Call",
  },
];

export function ContactCards({ data }: { data: ContactCard[] }) {
  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
      {data.map((item, index) => (
        <Card
          key={index}
          className="bg-transparent border border-white/10 flex flex-col justify-between"
        >
          <CardHeader>
            <CardTitle className="text-base">{item.title}</CardTitle>
            {item.subtitle && (
              <CardDescription className="text-white/60">
                {item.subtitle}
              </CardDescription>
            )}
          </CardHeader>

          <CardContent className="text-sm text-white/70">
            {item.content}
          </CardContent>

          <div className="p-4 pt-0">
            {item.actionLabel && (
              <Button variant="secondary" className="w-full">
                {item.actionLabel}
              </Button>
            )}
          </div>
        </Card>
      ))}
    </div>
  );
}
