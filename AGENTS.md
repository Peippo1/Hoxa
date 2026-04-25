# Hoxa Agent Guide

## Project Purpose

Hoxa is a portfolio-focused fitness product for beginner to intermediate users who want one supportive training system across running, strength, mobility, balance, and recovery. The product centers on `Plan`, `Train`, `Progress`, and `Social`, with a calm editorial tone and mock-first delivery.

## Current Status

- The iOS SwiftUI app now has a runnable Xcode project and builds successfully.
- Reusable empty, loading, and error state views are in place.
- The main iOS screens now read from one shared `DemoJourney` source of truth.
- The demo user is Avery Chen and the demo goal is a 10K target.
- Plan includes a local-only missed-session adjustment flow that can move a session, reduce intensity, or swap for recovery/mobility.
- The repo is still mock-first and public-safe. No real Apple Health, calendar, Garmin, or backend integrations are active yet.

## Repo Structure

- `backend/` FastAPI scaffold for plans, workouts, progress, social, and integration placeholders
- `design/` brand tokens and visual references
- `docs/` product, architecture, persona, and roadmap notes
- `ios-app/` runnable SwiftUI Xcode project for the primary app
- `web-app/` Next.js companion experience
- `marketing-site/` placeholder surface for later

## Working Style

- Keep changes small and legible.
- Preserve the current Hoxa tone and feature names.
- Prefer mock services, shared contracts, and simple MVVM-shaped code.
- Avoid redesigning screens unless the task explicitly requires it.
- Update docs when repo structure or workflow changes.

## Development Constraints for an 8GB M2 MacBook Air

- Keep one primary dev surface active at a time.
- Prefer incremental Xcode builds and small edits over broad refactors.
- Avoid memory-heavy browser tabs, multiple simulators, and duplicate dev servers.
- Keep generated artifacts and caches out of the repo where possible.
- Use lightweight mocks and avoid introducing unnecessary dependencies.

## Current Priorities

1. Keep the shared demo journey consistent across `Onboarding`, `Plan`, `Train`, `Progress`, and `Social`.
2. Preserve local-only adaptive Plan behavior and other mock-driven interactions.
3. Add placeholder states only where screens can genuinely be empty or delayed.
4. Keep mock contracts centralized and public-safe.
5. Leave real integrations and persistence for later.

## Next Build Targets

- Keep `Plan` updates local and visible when a missed-session adjustment is chosen.
- Preserve the shared `DemoJourney` as the source of truth for demo content.
- Add or refine placeholder states only on screens that still need them.
- Tighten copy and spacing on the demo path if it improves clarity for a reviewer.
- Keep integration seams ready for Apple Health and calendar, but do not wire them up yet.
- Avoid broad refactors unless they are required for buildability or demo clarity.

## Demo Journey

The intended portfolio demo path is:

1. Onboarding introduces Avery Chen and the 10K target.
2. Plan shows the weekly rhythm and the local missed-session adjustment flow.
3. Train shows the current workout detail.
4. Progress summarizes recent consistency and progress.
5. Social finishes with encouragement, props, and accountability.

## Rules for Future AI Coding Agents

- Treat the README as the source of truth for repo direction.
- Do not claim production readiness or active integrations that do not exist.
- Do not add real API integrations unless the task explicitly asks for them.
- Keep the mock-first workflow intact until real integrations are explicitly requested.
- Do not redesign the app when the task is implementation or hardening.
- Favor maintainable, readable edits over architectural overreach.
- Keep the repo public-safe and secret-free.
