"use client";

import { AppShell } from "@/components/app-shell";
import { EmptyState } from "@/components/ui/empty-state";
import { SurfaceCard } from "@/components/ui/surface-card";

export default function GlobalError({
  reset
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  return (
    <html lang="en">
      <body>
        <AppShell
          eyebrow="Something went wrong"
          title="The starter experience hit an unexpected issue."
          intro="This fallback is here so the app has a graceful error state from the beginning."
        >
          <SurfaceCard className="p-6 lg:p-8">
            <EmptyState
              title="Unable to load the current view"
              detail="Try again and, later, connect this state to structured logging and API error handling."
            />
            <button
              className="mt-6 rounded-full bg-ink px-5 py-3 text-sm text-canvas"
              onClick={reset}
              type="button"
            >
              Try again
            </button>
          </SurfaceCard>
        </AppShell>
      </body>
    </html>
  );
}
