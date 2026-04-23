import Link from "next/link";
import type { Route } from "next";

import { AppShell } from "@/components/app-shell";
import { SectionHeader } from "@/components/section-header";
import { MetricCard } from "@/components/ui/metric-card";
import { StatusPill } from "@/components/ui/status-pill";
import { SurfaceCard } from "@/components/ui/surface-card";
import { getDashboardSnapshot } from "@/lib/repository";

const pillarCards: Array<{
  title: string;
  href: Route;
  description: string;
}> = [
  {
    title: "Plan",
    href: "/plan",
    description: "Adaptive weekly calendar that balances running, strength, mobility, and recovery around real life."
  },
  {
    title: "Train",
    href: "/train",
    description: "Session details and workout library for gym, home, and running goals up to half marathon distance."
  },
  {
    title: "Progress",
    href: "/progress",
    description: "Track consistency, readiness, and modality balance without cluttered sports-tech charts."
  },
  {
    title: "Social",
    href: "/social",
    description: "Follow friends and give props in a low-pressure accountability loop."
  }
];

export default async function Home() {
  const { activeGoal, integrations, progressMetrics, weeklyPlan } = await getDashboardSnapshot();

  return (
    <AppShell
      eyebrow="Dashboard"
      title="A calm training product for goals that need more than one kind of session."
      intro="Hoxa helps people train for a 5K, 10K, half marathon, strength milestone, or simply a more balanced week. The experience prioritises elegant planning, supportive guidance, and a realistic rhythm across home, gym, and outdoor training."
    >
      <SurfaceCard className="fade-up grid gap-8 p-6 lg:grid-cols-[1.35fr_0.9fr] lg:p-8">
        <div>
          <div className="inline-flex rounded-full bg-blush/20 px-3 py-1 text-xs uppercase tracking-[0.24em] text-rosewood">
            This week’s shape
          </div>
          <h2 className="mt-5 max-w-3xl font-serif text-4xl leading-tight text-ink sm:text-5xl">
            Build toward a goal with a weekly plan that still leaves room for life.
          </h2>
          <p className="mt-4 max-w-2xl text-base leading-8 text-ink/70">
            The product is structured around one active goal, a weekly rhythm, and a set of sessions that can move intelligently when a day gets missed.
          </p>
          <div className="mt-8 flex flex-wrap gap-3">
            <Link
              href="/onboarding"
              className="rounded-full bg-ink px-5 py-3 text-sm text-canvas shadow-[0_14px_28px_rgba(47,41,37,0.22)] transition hover:-translate-y-0.5"
            >
              Start onboarding
            </Link>
            <Link
              href="/plan"
              className="rounded-full border border-ink/10 bg-white/70 px-5 py-3 text-sm text-ink transition hover:bg-white"
            >
              View weekly plan
            </Link>
          </div>
        </div>
        <div className="rounded-[1.8rem] bg-ink px-5 py-5 text-canvas">
          <div className="flex items-center justify-between text-xs uppercase tracking-[0.22em] text-canvas/65">
            <span>Active goal</span>
            <span>{activeGoal.targetDate}</span>
          </div>
          <div className="mt-5 font-serif text-3xl">{activeGoal.title}</div>
          <p className="mt-3 text-sm leading-7 text-canvas/72">{activeGoal.tagline}</p>
          <div className="mt-5 space-y-4">
            {weeklyPlan.slice(0, 4).map((session) => (
              <div key={session.id} className="rounded-[1.4rem] border border-white/10 bg-white/6 p-4">
                <div className="flex items-start justify-between gap-4">
                  <div>
                    <div className="text-xs uppercase tracking-[0.2em] text-canvas/55">{session.day}</div>
                    <div className="mt-2 text-lg font-medium">{session.title}</div>
                  </div>
                  <StatusPill label={session.status} tone="ink" />
                </div>
                <div className="mt-3 flex flex-wrap gap-2 text-sm text-canvas/70">
                  <span>{session.sessionType}</span>
                  <span>•</span>
                  <span>{session.duration}</span>
                  <span>•</span>
                  <span>{session.effort}</span>
                </div>
              </div>
            ))}
          </div>
        </div>
      </SurfaceCard>

      <section className="grid gap-5 lg:grid-cols-[1.1fr_0.9fr]">
        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Product pillars"
            description="Each top-level area exists to make the training system easy to understand and maintain."
          />
          <div className="mt-6 grid gap-4 sm:grid-cols-2">
            {pillarCards.map((card) => (
              <Link
                key={card.title}
                href={card.href}
                className="rounded-[1.7rem] border border-ink/8 bg-canvas/60 p-5 transition hover:-translate-y-1 hover:bg-white"
              >
                <div className="font-serif text-2xl">{card.title}</div>
                <p className="mt-3 text-sm leading-7 text-ink/65">{card.description}</p>
              </Link>
            ))}
          </div>
        </SurfaceCard>

        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Integration-ready foundation"
            description="The MVP keeps integrations mocked but visible so future work has clear seams."
          />
          <div className="mt-6 space-y-4">
            {integrations.map((integration) => (
              <div key={integration.provider} className="rounded-[1.6rem] border border-white/70 bg-white/80 p-5">
                <div className="flex flex-wrap items-start justify-between gap-3">
                  <div className="max-w-xl">
                    <div className="font-medium text-ink">{integration.provider}</div>
                    <p className="mt-2 text-sm leading-7 text-ink/65">{integration.note}</p>
                  </div>
                  <StatusPill label={integration.state} tone={integration.state === "Mock Ready" ? "mint" : "warm"} />
                </div>
              </div>
            ))}
          </div>
        </SurfaceCard>
      </section>

      <section className="grid gap-5 lg:grid-cols-[0.95fr_1.05fr]">
        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Progress at a glance"
            description="Metrics stay simple and motivational rather than dense or intimidating."
          />
          <div className="mt-6 grid gap-4">
            {progressMetrics.map((metric) => (
              <MetricCard key={metric.label} label={metric.label} value={metric.value} change={metric.change} />
            ))}
          </div>
        </SurfaceCard>

        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Adaptive planning cue"
            description="The product should show why a week changed in plain language."
          />
          <div className="mt-6 rounded-[1.8rem] bg-white/78 p-6">
            <div className="inline-flex rounded-full bg-blush/16 px-3 py-1 text-xs uppercase tracking-[0.18em] text-rosewood">
              Week update
            </div>
            <div className="mt-4 font-serif text-3xl text-ink">Sunday strength was moved to protect long-run recovery.</div>
            <p className="mt-4 max-w-2xl text-sm leading-7 text-ink/65">
              This is the kind of product explanation that makes Hoxa feel supportive and smart instead of arbitrary.
            </p>
            <div className="mt-6 grid gap-3 sm:grid-cols-2">
              {[
                "Keep the long run intact",
                "Preserve at least one mobility or recovery touchpoint",
                "Move support sessions before deleting them",
                "Avoid stacking hard work across consecutive days"
              ].map((rule) => (
                <div key={rule} className="rounded-[1.4rem] bg-sage/55 p-4 text-sm text-ink/68">
                  {rule}
                </div>
              ))}
            </div>
          </div>
        </SurfaceCard>
      </section>
    </AppShell>
  );
}
