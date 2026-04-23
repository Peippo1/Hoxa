import { AppShell } from "@/components/app-shell";
import { SectionHeader } from "@/components/section-header";
import { SurfaceCard } from "@/components/ui/surface-card";
import { StatusPill } from "@/components/ui/status-pill";
import { getOnboardingData } from "@/lib/repository";

export default async function OnboardingPage() {
  const { goals, questions } = await getOnboardingData();

  return (
    <AppShell
      eyebrow="Onboarding"
      title="Start with a goal, your current level, and the constraints that shape real life."
      intro="The onboarding flow should feel concise but meaningful. It should collect just enough detail to generate a believable first week."
    >
      <section className="grid gap-5 lg:grid-cols-[0.8fr_1.2fr]">
        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Core setup"
            description="Every prompt here changes the plan logic or the tone of the sessions recommended."
          />
          <div className="mt-6 space-y-4">
            {questions.map((question, index) => (
              <div key={question.id} className="rounded-[1.5rem] bg-sage/50 p-4">
                <div className="text-xs uppercase tracking-[0.2em] text-ink/45">
                  Step {index + 1} · {question.label}
                </div>
                <div className="mt-2 font-medium text-ink">{question.prompt}</div>
                <div className="mt-4 flex flex-wrap gap-2">
                  {question.selections.map((selection) => (
                    <StatusPill key={selection} label={selection} tone="neutral" />
                  ))}
                </div>
              </div>
            ))}
          </div>
        </SurfaceCard>

        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Starter goal selection"
            description="Goal cards can later become interactive, but the scaffold already shows the MVP direction."
            action="Save sample setup"
          />
          <div className="mt-6 grid gap-4">
            {goals.map((goal, index) => (
              <div
                key={goal.id}
                className={`rounded-[1.6rem] border p-5 ${
                  index === 2
                    ? "border-blush bg-blush/18 shadow-[0_14px_35px_rgba(220,155,155,0.15)]"
                    : "border-ink/8 bg-white/75"
                }`}
              >
                <div className="flex items-center justify-between gap-4">
                  <div>
                    <div className="font-medium text-ink">{goal.title}</div>
                    <p className="mt-2 max-w-2xl text-sm leading-7 text-ink/65">{goal.tagline}</p>
                  </div>
                  <StatusPill label={goal.targetDate} tone="warm" />
                </div>
                <div className="mt-4 inline-flex rounded-full bg-sage px-3 py-1 text-xs uppercase tracking-[0.18em] text-ink/70">
                  {goal.weeklyMix}
                </div>
              </div>
            ))}
          </div>
        </SurfaceCard>
      </section>
    </AppShell>
  );
}
