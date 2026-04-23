import { AppShell } from "@/components/app-shell";
import { SectionHeader } from "@/components/section-header";
import { StatusPill } from "@/components/ui/status-pill";
import { SurfaceCard } from "@/components/ui/surface-card";
import { getSocialData } from "@/lib/repository";

export default async function SocialPage() {
  const { feed, following } = await getSocialData();

  return (
    <AppShell
      eyebrow="Social"
      title="A supportive social layer built around follows and props rather than noisy comparison."
      intro="The MVP keeps the social model deliberately light. The goal is accountability and encouragement, not an infinite feed."
    >
      <section className="grid gap-5 lg:grid-cols-[0.9fr_1.1fr]">
        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Following"
            description="A small circle makes social activity feel warm and personal."
          />
          <div className="mt-6 space-y-4">
            {following.map((profile) => (
              <div key={profile.id} className="flex items-center justify-between rounded-[1.5rem] bg-white/80 p-4">
                <div>
                  <div className="font-medium text-ink">{profile.name}</div>
                  <div className="text-sm text-ink/55">{profile.focus}</div>
                </div>
                <StatusPill label={profile.streak} tone="neutral" />
              </div>
            ))}
          </div>
        </SurfaceCard>

        <SurfaceCard className="p-6 lg:p-8">
          <SectionHeader
            title="Recent activity"
            description="Props should be one tap, visible, and quietly rewarding, with privacy boundaries already implied."
          />
          <div className="mt-6 space-y-4">
            {feed.map((activity) => (
              <div key={activity.id} className="rounded-[1.6rem] border border-ink/8 bg-white/78 p-5">
                <div className="flex flex-wrap items-start justify-between gap-4">
                  <div className="max-w-2xl">
                    <div className="font-medium text-ink">
                      {activity.name} <span className="text-ink/55">{activity.action}</span>
                    </div>
                    <p className="mt-2 text-sm leading-7 text-ink/65">{activity.detail}</p>
                  </div>
                  <button className="rounded-full bg-blush/18 px-4 py-2 text-xs uppercase tracking-[0.18em] text-rosewood">
                    Send props
                  </button>
                </div>
                <div className="mt-4 flex items-center justify-between text-xs uppercase tracking-[0.2em] text-ink/42">
                  <span>{activity.props} props so far</span>
                  <span>{activity.visibility}</span>
                </div>
              </div>
            ))}
          </div>
        </SurfaceCard>
      </section>
    </AppShell>
  );
}
