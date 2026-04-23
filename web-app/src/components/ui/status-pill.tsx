type StatusPillProps = {
  label: string;
  tone?: "neutral" | "warm" | "mint" | "ink";
};

const toneClasses: Record<NonNullable<StatusPillProps["tone"]>, string> = {
  neutral: "bg-sage text-ink/70",
  warm: "bg-blush/20 text-rosewood",
  mint: "bg-mint text-ink/80",
  ink: "bg-ink text-canvas/85"
};

export function StatusPill({ label, tone = "neutral" }: StatusPillProps) {
  return (
    <span className={`rounded-full px-3 py-1 text-[11px] uppercase tracking-[0.18em] ${toneClasses[tone]}`}>
      {label}
    </span>
  );
}
