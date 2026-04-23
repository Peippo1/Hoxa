type MetricCardProps = {
  label: string;
  value: string;
  change: string;
};

export function MetricCard({ label, value, change }: MetricCardProps) {
  return (
    <article className="rounded-[1.6rem] bg-sage/55 p-5">
      <div className="text-sm text-ink/55">{label}</div>
      <div className="mt-3 font-serif text-4xl text-ink">{value}</div>
      <div className="mt-2 text-sm text-rosewood">{change}</div>
    </article>
  );
}
