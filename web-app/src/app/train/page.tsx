import { AppShell } from "@/components/app-shell";
import { SectionHeader } from "@/components/section-header";
import { EmptyState } from "@/components/ui/empty-state";
import { SurfaceCard } from "@/components/ui/surface-card";
import { getTrainData } from "@/lib/repository";

export default async function TrainPage() {
  const { todaySession, workoutLibrary } = await getTrainData();

  return (
    <AppShell
      eyebrow="Train"
      title="Session detail and a workout library that works across home, gym, and outdoor training."
      intro="The training experience should help the user start quickly, understand the purpose of the workout, and log what they actually completed without friction."
    >
      <section className="grid gap-5 lg:grid-cols-[0.95fr_1.05fr]">
        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Today"
            description="A single clear next action keeps the experience supportive and low-friction."
            action="Log session manually"
          />
          <div className="mt-6 rounded-[1.8rem] bg-ink p-6 text-canvas">
            <div className="text-xs uppercase tracking-[0.22em] text-canvas/55">{todaySession.sessionType}</div>
            <div className="mt-4 font-serif text-4xl leading-tight">{todaySession.title}</div>
            <div className="mt-4 flex flex-wrap gap-2 text-sm text-canvas/70">
              <span>{todaySession.duration}</span>
              <span>•</span>
              <span>{todaySession.effort}</span>
              <span>•</span>
              <span>{todaySession.location}</span>
            </div>
            <p className="mt-5 text-sm leading-7 text-canvas/72">{todaySession.reason}</p>
            <div className="mt-6 grid gap-3 sm:grid-cols-3">
              {["Warm up", "Main set", "Cool down"].map((phase) => (
                <div key={phase} className="rounded-[1.3rem] border border-white/10 bg-white/5 p-4">
                  <div className="text-xs uppercase tracking-[0.18em] text-canvas/50">{phase}</div>
                  <div className="mt-2 text-sm text-canvas/75">
                    {phase === "Warm up"
                      ? "5 minutes easy + dynamic mobility"
                      : phase === "Main set"
                        ? "Primary effort block with beginner-friendly cues"
                        : "Walk, breathe down, and note any tightness"}
                  </div>
                </div>
              ))}
            </div>
          </div>
        </SurfaceCard>

        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Workout library"
            description="Templates are intentionally broad in the MVP so the product can cover key modalities without too much content overhead."
          />
          {workoutLibrary.length === 0 ? (
            <div className="mt-6">
              <EmptyState
                title="Library coming next"
                detail="Keep a clean empty state in place from the start so future data-loading work has a clear fallback."
              />
            </div>
          ) : (
            <div className="mt-6 space-y-4">
              {workoutLibrary.map((item) => (
                <div key={item.id} className="rounded-[1.6rem] border border-ink/8 bg-white/75 p-5">
                  <div className="flex flex-wrap items-start justify-between gap-3">
                    <div>
                      <div className="font-medium text-ink">{item.title}</div>
                      <div className="mt-2 text-sm text-ink/55">{item.category}</div>
                    </div>
                    <span className="rounded-full bg-sage px-3 py-1 text-xs uppercase tracking-[0.18em] text-ink/70">
                      {item.duration}
                    </span>
                  </div>
                  <div className="mt-4 flex flex-wrap gap-2 text-xs uppercase tracking-[0.18em] text-ink/50">
                    <span>{item.equipment}</span>
                    <span>•</span>
                    <span>{item.level}</span>
                    <span>•</span>
                    <span>{item.focus}</span>
                  </div>
                </div>
              ))}
            </div>
          )}
        </SurfaceCard>
      </section>
    </AppShell>
  );
}
