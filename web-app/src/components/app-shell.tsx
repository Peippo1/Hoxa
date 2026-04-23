"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import type { ReactNode } from "react";

const navItems = [
  { href: "/", label: "Overview" },
  { href: "/plan", label: "Plan" },
  { href: "/train", label: "Train" },
  { href: "/progress", label: "Progress" },
  { href: "/social", label: "Social" },
  { href: "/onboarding", label: "Onboarding" }
] as const;

type AppShellProps = {
  title: string;
  eyebrow: string;
  intro: string;
  children: ReactNode;
};

export function AppShell({ title, eyebrow, intro, children }: AppShellProps) {
  const pathname = usePathname();

  return (
    <div className="min-h-screen bg-canvas text-ink">
      <div className="ambient-orb ambient-orb-left" />
      <div className="ambient-orb ambient-orb-right" />
      <div className="mx-auto flex min-h-screen max-w-7xl flex-col px-4 py-6 sm:px-6 lg:px-8">
        <header className="mb-8 rounded-[2rem] border border-white/60 bg-white/70 px-5 py-4 shadow-[0_16px_50px_rgba(97,72,57,0.08)] backdrop-blur md:px-6">
          <div className="flex flex-col gap-5 md:flex-row md:items-start md:justify-between">
            <div className="max-w-2xl">
              <div className="mb-2 text-xs uppercase tracking-[0.32em] text-rosewood/70">
                {eyebrow}
              </div>
              <div className="flex items-end gap-3">
                <Link href="/" className="font-serif text-4xl leading-none text-rosewood sm:text-5xl">
                  Hoxa
                </Link>
                <span className="mb-1 rounded-full border border-sage/90 bg-sage/60 px-3 py-1 text-xs uppercase tracking-[0.2em] text-ink/75">
                  Calm fitness
                </span>
              </div>
              <h1 className="mt-4 max-w-xl font-serif text-3xl leading-tight sm:text-4xl">{title}</h1>
              <p className="mt-3 max-w-2xl text-sm leading-7 text-ink/70 sm:text-base">{intro}</p>
            </div>
            <div className="rounded-[1.75rem] border border-white/70 bg-canvas/85 px-4 py-4 text-sm shadow-[0_12px_40px_rgba(97,72,57,0.07)]">
              <div className="text-xs uppercase tracking-[0.24em] text-ink/45">This week</div>
              <div className="mt-3 flex items-center gap-3">
                <div className="h-12 w-12 rounded-full bg-blush/85 p-1 shadow-inner">
                  <div className="flex h-full w-full items-center justify-center rounded-full bg-white text-lg font-semibold text-rosewood">
                    5
                  </div>
                </div>
                <div>
                  <div className="font-medium text-ink">Sessions placed</div>
                  <div className="text-ink/60">2 runs, 2 strength, 1 mobility</div>
                </div>
              </div>
            </div>
          </div>
          <nav className="mt-5 flex flex-wrap gap-2">
            {navItems.map((item) => {
              const active = pathname === item.href;

              return (
                <Link
                  key={item.href}
                  href={item.href}
                  className={`rounded-full px-4 py-2 text-sm transition ${
                    active
                      ? "bg-ink text-canvas shadow-[0_8px_24px_rgba(54,42,35,0.2)]"
                      : "bg-white/80 text-ink/70 hover:bg-white"
                  }`}
                >
                  {item.label}
                </Link>
              );
            })}
          </nav>
        </header>
        <main className="grid flex-1 gap-5">{children}</main>
      </div>
    </div>
  );
}
