type EmptyStateProps = {
  title: string;
  detail: string;
};

export function EmptyState({ title, detail }: EmptyStateProps) {
  return (
    <div className="rounded-[1.7rem] border border-dashed border-ink/12 bg-white/60 p-6">
      <div className="font-serif text-2xl text-ink">{title}</div>
      <p className="mt-3 max-w-xl text-sm leading-7 text-ink/60">{detail}</p>
    </div>
  );
}
