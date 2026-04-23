# Hoxa Architecture

## Goals

- keep the MVP achievable for one developer
- create clean seams for future intelligence and integrations
- let iOS and web share product concepts even if they do not yet share code
- keep wearable, calendar, and social features adapter-driven

## High-Level System

```text
SwiftUI iOS App        Next.js Web App
       |                     |
       | REST / JSON         | REST / JSON
       +-----------> FastAPI Backend <-----------+
                         |                       |
                         |                       |
                  Planning / Sessions       Future Integrations
                         |                       |
                         +--- Health / Watch ----+
                         +--- Garmin ------------+
                         +--- Google Calendar ---+
                         +--- Apple Calendar ----+
```

## Repositories Within This Monorepo

### `ios-app`

- primary product experience
- SwiftUI app shell
- local fixtures for previews and early iteration
- lightweight MVVM-style feature view models for screen shaping
- future HealthKit and Watch-friendly service boundaries

### `web-app`

- dashboard, planning, and social companion experience
- fast UI iteration environment
- future authenticated planner and social surfaces

### `backend`

- source of truth for plans, sessions, and progress contracts
- future home for adaptive rules, sync orchestration, and social graph features

### `docs`

- product and implementation decisions
- shared example data
- IA and roadmap

## Domain Model

### Core entities

- `User`
- `Goal`
- `TrainingPlan`
- `PlanWeek`
- `PlanSession`
- `WorkoutTemplate`
- `WorkoutLog`
- `ProgressSnapshot`
- `SocialProfile`
- `ActivityEvent`
- `Prop`
- `ExternalConnection`

### Important design decision

The plan is the primary organising object. Sessions, logs, progress, and social moments all attach back to a plan context or a goal context where possible.

## Backend Layers

### API layer

- FastAPI route handlers
- request and response schemas
- thin orchestration only

### Service layer

- planning logic
- progress aggregation
- social feed assembly
- integration orchestration

### Data layer

- mock repositories for MVP
- later replaceable with database-backed repositories

### Integration layer

- provider-specific adapter seams
- mock adapter registry for current scaffold
- future Health, Garmin, and calendar connectors

## Recommended Backend Evolution

### MVP

- in-memory or file-backed repositories
- deterministic example plan generation
- mock social feed

### Next

- PostgreSQL
- SQLAlchemy or SQLModel
- background job runner for sync processing
- auth provider integration

## Adaptive Calendar Approach

For MVP, keep the adaptive system rule-based:

- define target weekly modality mix from the selected goal
- place anchor sessions first
- fill remaining slots with support work
- rebalance when a session is missed
- protect recovery spacing
- prefer moving lower-priority sessions before deleting them

This keeps the product believable without requiring a heavy AI system.

## Integration Boundaries

### Health and wearables

Create provider protocols now, even if implementations stay mocked:

- `WorkoutHistoryProvider`
- `RecoverySignalProvider`
- `DeviceConnectionProvider`

### Calendar providers

- `AvailabilityProvider`
- `CalendarWriteProvider`

### Why this matters

The UI can build around stable concepts like availability windows and imported workouts without coupling the product to one vendor.

## iOS Architecture

- SwiftUI with feature-first folders
- app shell with `TabView`
- lightweight observable app state
- small feature view models for `Plan`, `Train`, `Progress`, `Social`, and onboarding
- protocol-based services for planning, logs, social, and integrations
- fixtures for preview-driven development

## Web Architecture

- Next.js App Router
- route-per-pillar structure
- Tailwind for product styling
- static mock data in `src/lib` for MVP
- lightweight mock repository for server-ready page data access
- server-ready boundaries for future data fetching

## Data Contracts

Keep identical naming across platforms:

- `goalType`
- `sessionType`
- `sessionStatus`
- `effort`
- `durationMinutes`
- `scheduledFor`
- `completedAt`

This reduces friction when the iOS and web clients start consuming shared backend responses.

## Suggested Future Infrastructure

- PostgreSQL for primary data
- Redis only if queueing and caching justify it
- object storage for richer media later
- OAuth-based external connection service
- background jobs for ingestion and sync

## Security And Privacy Notes

- do not over-collect health data in MVP
- separate imported source data from user-authored notes
- make third-party connections explicit and revocable
- keep social visibility settings simple and private by default
- keep the public repo free of real keys, secrets, personal config, or private endpoints
