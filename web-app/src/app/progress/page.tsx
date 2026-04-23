import { AppShell } from "@/components/app-shell";
import { SectionHeader } from "@/components/section-header";
import { MetricCard } from "@/components/ui/metric-card";
import { SurfaceCard } from "@/components/ui/surface-card";
import { getProgressData } from "@/lib/repository";

const balanceRows = [
  { label: "Running", current: 2, target: 2 },
  { label: "Strength", current: 2, target: 2 },
  { label: "Mobility", current: 1, target: 1 },
  { label: "Recovery", current: 1, target: 1 }
];

export default async function ProgressPage() {
  const { metrics, notes } = await getProgressData();

  return (
    <AppShell
      eyebrow="Progress"
      title="Track consistency, readiness, and balance without turning the product into an intimidating analytics tool."
      intro="Progress should feel useful in under a minute. The first layer emphasises consistency, current training balance, and whether the user is trending in the right direction."
    >
      <section className="grid gap-5 lg:grid-cols-3">
        {metrics.map((metric) => (
          <SurfaceCard key={metric.label} className="p-6 lg:p-8">
            <MetricCard label={metric.label} value={metric.value} change={metric.change} />
          </SurfaceCard>
        ))}
      </section>

      <section className="grid gap-5 lg:grid-cols-[1.05fr_0.95fr]">
        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Weekly balance"
            description="Mobility and recovery stay visible so the product does not implicitly reward only volume."
          />
          <div className="mt-6 space-y-4">
            {balanceRows.map((row) => (
              <div key={row.label} className="rounded-[1.5rem] bg-white/75 p-4">
                <div className="flex items-center justify-between gap-4 text-sm">
                  <span className="font-medium text-ink">{row.label}</span>
                  <span className="text-ink/55">
                    {row.current} / {row.target}
                  </span>
                </div>
                <div className="mt-3 h-3 rounded-full bg-sage/70">
                  <div
                    className="h-3 rounded-full bg-blush"
                    style={{ width: `${(row.current / row.target) * 100}%` }}
                  />
                </div>
              </div>
            ))}
          </div>
        </SurfaceCard>

        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Progress notes"
            description="A calm narrative layer helps users interpret trends without needing technical charts."
          />
          <div className="mt-6 space-y-4 text-sm leading-7 text-ink/68">
            {notes.map((note, index) => (
              <div
                key={note.id}
                className={`rounded-[1.5rem] p-4 ${
                  index === 0 ? "bg-sage/50" : index === 1 ? "bg-white/80" : "bg-mint/55"
                }`}
              >
                <div className="font-medium text-ink">{note.title}</div>
                <div className="mt-2">{note.detail}</div>
              </div>
            ))}
          </div>
        </SurfaceCard>
      </section>
    </AppShell>
  );
}
