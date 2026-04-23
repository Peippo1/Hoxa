type SectionHeaderProps = {
  title: string;
  description: string;
  action?: string;
};

export function SectionHeader({ title, description, action }: SectionHeaderProps) {
  return (
    <div className="flex flex-col gap-3 sm:flex-row sm:items-end sm:justify-between">
      <div>
        <h2 className="font-serif text-2xl text-ink">{title}</h2>
        <p className="mt-1 max-w-2xl text-sm leading-7 text-ink/60">{description}</p>
      </div>
      {action ? (
        <button className="inline-flex items-center rounded-full border border-ink/10 bg-white/80 px-4 py-2 text-sm text-ink transition hover:bg-white">
          {action}
        </button>
      ) : null}
    </div>
  );
}
