# Hoxa

Hoxa is a modern multi-platform fitness product for beginner to intermediate users who want one supportive training system across running, strength, mobility, balance, and recovery.

The product is designed around a single idea: people rarely train for just one modality in isolation. Hoxa helps users train toward specific goals such as a 5K, 10K, half marathon, strength milestone, or general consistency target using an adaptive calendar that fits around real life.

This repo is intentionally scoped as a portfolio-quality MVP foundation: polished enough to feel like a real product, simple enough for a solo developer to evolve.

## What Hoxa Is

- an adaptive training planner
- a fitness companion for real life
- supportive rather than intimidating
- designed for hybrid users who combine running, strength, mobility, balance, and recovery

## Product Promise

Hoxa should help a user answer:

- what am I training for
- what should I do this week
- how does this fit around my life
- what changed if I missed a session
- am I progressing in a balanced way

## Product Pillars

1. `Plan`  
   Build a realistic weekly rhythm around goals, availability, recovery needs, and preferred training mix.
2. `Train`  
   Access guided sessions across running, strength, home workouts, mobility, balance, and recovery.
3. `Progress`  
   Review consistency, volume, milestone trends, and readiness over time.
4. `Social`  
   Follow friends, celebrate completed sessions with props, and stay accountable without turning the product into a noisy feed.

## Repository Structure

```text
hoxa/
├── backend/         FastAPI scaffold for plans, workouts, progress, social, and integrations
├── design/          Brand tokens and design references
├── docs/            Product thinking, architecture, personas, and integration plans
├── ios-app/         Runnable SwiftUI Xcode project for the primary app
├── marketing-site/  Future marketing surface placeholder
└── web-app/         Next.js companion experience for planning, dashboard, and social
```

## Experience Principles

- Calm, premium, and editorial rather than aggressive sports-tech
- Beginner-friendly without feeling simplistic
- Mobility and recovery treated as first-class parts of training
- Training plans that adapt to time, energy, and missed sessions
- Architecture that can grow into Apple Health, Apple Watch, Garmin, Google Calendar, Apple Calendar, and social features

## MVP Focus

The current repository is centred on five practical outcomes:

1. polished starter UI
2. clear docs
3. believable mock data
4. good architecture
5. future-ready integration points

## MVP Scope

The current scaffold prioritises:

- onboarding and goal selection
- adaptive weekly training calendar
- workout library and session details
- manual workout logging
- progress dashboards
- lightweight social features like follows and props
- integration-ready architecture for Apple Health and calendar syncing

## Example User Goals

- first 5K
- faster 10K
- first half marathon
- upper body or chest strength progress
- better consistency around work and life
- better mobility and balance

## Shared Example Data

Canonical example data lives in [`docs/examples`](./docs/examples):

- `sample-goals.json`
- `sample-users.json`
- `example-training-plan.json`
- `README.md`

The web app, iOS app, and backend are scaffolded around the same concepts and naming so they can converge on shared contracts later.

## Local Setup

This repo is public-safe by default:

- no real keys or secrets should ever be committed
- only `.env.example` files are included
- all integrations use mock providers or placeholder adapters for now

## Getting Started

### Web app

```bash
cd web-app
npm install
npm run dev
```

See [`web-app/README.md`](./web-app/README.md) and [`web-app/.env.example`](./web-app/.env.example).

### Backend

```bash
cd backend
python3 -m venv .venv
source .venv/bin/activate
pip install -e .
uvicorn app.main:app --reload
```

See [`backend/README.md`](./backend/README.md) and [`backend/.env.example`](./backend/.env.example).

### iOS app

The iOS directory contains a runnable SwiftUI Xcode project. Open [`ios-app/Hoxa.xcodeproj`](./ios-app/Hoxa.xcodeproj) and see [`ios-app/README.md`](./ios-app/README.md) for the quickest way to run it.

## Documentation

- [`docs/README.md`](./docs/README.md)
- [`docs/product-brief.md`](./docs/product-brief.md)
- [`docs/mvp-roadmap.md`](./docs/mvp-roadmap.md)
- [`docs/architecture.md`](./docs/architecture.md)
- [`docs/information-architecture.md`](./docs/information-architecture.md)
- [`docs/user-personas.md`](./docs/user-personas.md)
- [`docs/training-engine-notes.md`](./docs/training-engine-notes.md)
- [`docs/integrations-roadmap.md`](./docs/integrations-roadmap.md)

## Current Repo Standards

- monorepo structure kept simple and readable
- typed models and mock data across surfaces
- public-safe configuration via `.env.example` only
- route and feature structure aligned to `Plan`, `Train`, `Progress`, and `Social`
- docs updated alongside major scaffolding changes

## Next Steps

Short-term product and engineering tasks:

1. Convert the SwiftUI source scaffold into a full Xcode project.
2. Replace duplicated mock data with shared contracts from the backend.
3. Add real empty, loading, and error flows once backend integration starts.
4. Implement first-pass adaptive plan rules for missed sessions and schedule constraints.
5. Add placeholder auth and user profile scaffolding.
6. Start integration adapters for Apple Health and calendar availability.
