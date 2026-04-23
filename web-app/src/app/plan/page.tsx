import { AppShell } from "@/components/app-shell";
import { SectionHeader } from "@/components/section-header";
import { StatusPill } from "@/components/ui/status-pill";
import { SurfaceCard } from "@/components/ui/surface-card";
import { getPlanData } from "@/lib/repository";

export default async function PlanPage() {
  const { activeGoal, trainingBlocks, weeklyPlan } = await getPlanData();

  return (
    <AppShell
      eyebrow="Plan"
      title="An adaptive weekly calendar that explains why each session is here."
      intro="The planning experience should feel structured but forgiving. Sessions can move when life changes, while the overall weekly training balance stays intact."
    >
      <SurfaceCard className="p-6 lg:p-8">
        <SectionHeader
          title="Weekly calendar"
          description="This starter calendar mixes running, strength, and mobility with clear effort and rationale."
          action="Rebalance week"
        />
        <div className="mt-6 rounded-[1.7rem] bg-white/72 p-5">
          <div className="text-xs uppercase tracking-[0.2em] text-ink/45">Active goal</div>
          <div className="mt-2 font-serif text-3xl text-ink">{activeGoal.title}</div>
          <p className="mt-3 max-w-3xl text-sm leading-7 text-ink/65">{activeGoal.tagline}</p>
        </div>
        <div className="mt-6 grid gap-4 md:grid-cols-2 xl:grid-cols-5">
          {weeklyPlan.map((session) => (
            <article key={session.id} className="rounded-[1.7rem] border border-ink/8 bg-white/75 p-5">
              <div className="flex items-center justify-between gap-3">
                <div className="text-xs uppercase tracking-[0.22em] text-ink/45">{session.day}</div>
                <StatusPill
                  label={session.status}
                  tone={
                    session.status === "Done" ? "mint" : session.status === "Today" ? "warm" : session.status === "Moved" ? "ink" : "neutral"
                  }
                />
              </div>
              <div className="mt-4 font-serif text-2xl text-ink">{session.title}</div>
              <div className="mt-4 flex flex-wrap gap-2 text-xs uppercase tracking-[0.18em] text-ink/55">
                <span>{session.sessionType}</span>
                <span>{session.duration}</span>
                <span>{session.effort}</span>
                <span>{session.location}</span>
              </div>
              <p className="mt-4 text-sm leading-7 text-ink/65">{session.reason}</p>
              {session.rescheduleHint ? (
                <div className="mt-4 rounded-[1.2rem] bg-sage/55 p-3 text-sm text-ink/62">{session.rescheduleHint}</div>
              ) : null}
            </article>
          ))}
        </div>
      </SurfaceCard>

      <section className="grid gap-5 lg:grid-cols-2">
        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Training blocks"
            description="Starter block structure keeps progression believable without overengineering the first version."
          />
          <div className="mt-6 space-y-4">
            {trainingBlocks.map((block) => (
              <div key={block.id} className="rounded-[1.4rem] bg-sage/50 p-4">
                <div className="text-xs uppercase tracking-[0.18em] text-ink/45">{block.window}</div>
                <div className="mt-2 font-medium text-ink">{block.title}</div>
                <div className="mt-2 text-sm leading-7 text-ink/70">{block.summary}</div>
              </div>
            ))}
          </div>
        </SurfaceCard>

        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Adaptive rules"
            description="Rule-based behaviour keeps the product legible and easier to tune for an MVP."
          />
          <div className="mt-6 grid gap-3">
            {[
              "Move easier sessions before deleting them when a day is missed.",
              "Protect one recovery or mobility slot after the longest weekly effort.",
              "Keep strength frequency steady even during run-focused blocks.",
              "Respect weekday time limits before increasing session volume."
            ].map((rule) => (
              <div key={rule} className="rounded-[1.4rem] border border-ink/8 bg-white/80 px-4 py-4 text-sm leading-7 text-ink/70">
                {rule}
              </div>
            ))}
          </div>
        </SurfaceCard>
      </section>
    </AppShell>
  );
}
