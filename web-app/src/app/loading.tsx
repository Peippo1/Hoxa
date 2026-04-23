import { AppShell } from "@/components/app-shell";
import { SurfaceCard } from "@/components/ui/surface-card";

export default function Loading() {
  return (
    <AppShell
      eyebrow="Loading"
      title="Preparing the Hoxa preview."
      intro="Starter states should feel calm and intentional rather than abrupt."
    >
      <SurfaceCard className="p-6 lg:p-8">
        <div className="grid gap-4 md:grid-cols-3">
          {Array.from({ length: 6 }).map((_, index) => (
            <div key={index} className="rounded-[1.6rem] bg-white/70 p-5">
              <div className="h-4 w-24 animate-pulse rounded-full bg-sage" />
              <div className="mt-4 h-10 w-2/3 animate-pulse rounded-full bg-blush/25" />
              <div className="mt-4 h-3 w-full animate-pulse rounded-full bg-sage/75" />
              <div className="mt-2 h-3 w-5/6 animate-pulse rounded-full bg-sage/60" />
            </div>
          ))}
        </div>
      </SurfaceCard>
    </AppShell>
  );
}
