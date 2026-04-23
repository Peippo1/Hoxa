# Hoxa Integrations Roadmap

## Principle

Integrations should make the planning experience more realistic, not make the MVP harder to ship. The repo should prepare clean adapters now and defer full sync complexity until the product foundation is strong.

## Stage 1: Public-Safe MVP Placeholders

Current repo standard:

- no real keys
- no private endpoints
- no personal config
- `.env.example` files only
- mock services and placeholder adapters

## Stage 2: Apple Health / Apple Watch

### Purpose

- import workout history
- support progress timelines and consistency summaries
- eventually use workout and recovery context for plan adaptation

### Needed architecture

- `WorkoutHistoryProvider`
- `RecoverySignalProvider`
- import mapping from HealthKit workout types to Hoxa session categories

## Stage 3: Garmin

### Purpose

- support users outside the Apple ecosystem
- import runs and training history

### Needed architecture

- connector setup flow
- import normalization
- read-only history ingest before any advanced sync

## Stage 4: Google Calendar

### Purpose

- read availability windows
- help place sessions in realistic slots

### Needed architecture

- `AvailabilityProvider`
- optional future training-event write-back

## Stage 5: Apple Calendar / iCal

### Purpose

- support users who live in Apple’s scheduling tools
- allow planned sessions to appear in the user calendar later

### Needed architecture

- `AvailabilityProvider`
- `CalendarWriteProvider`

## Suggested Order

1. Apple Health
2. Google Calendar
3. Apple Calendar
4. Garmin

## Repo Impact

Each integration should eventually have:

- a small adapter interface
- a mock implementation
- a future provider-specific implementation
- documentation for expected payload shape and privacy constraints
