# Hoxa Backend

FastAPI scaffold for the Hoxa planning, training, progress, and lightweight social APIs.

## Current scope

- mock goals
- current adaptive week response
- workout library response
- manual workout logging endpoint
- progress summary response
- social feed response
- integration status placeholder

## Structure

- `app/api/`: route definitions
- `app/services/`: application orchestration
- `app/repositories/`: mock data access layer
- `app/integrations/`: future adapter seams for Health, Garmin, and calendar providers
- `app/schemas/`: request and response contracts
- `app/data/`: mock seed content

## Run locally

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e .
uvicorn app.main:app --reload
```

Use [`./.env.example`](./.env.example) as the only repo-committed environment reference.

## API shape

- `GET /health`
- `GET /api/goals`
- `GET /api/plans/current`
- `GET /api/workouts/library`
- `POST /api/workout-logs`
- `GET /api/progress/summary`
- `GET /api/social/feed`
- `GET /api/integrations`

## Future direction

- persist plans, workouts, and follows in a database
- add auth and user-specific data
- move from static mock data to rule-based adaptive planning
- add Health, Garmin, and calendar ingestion jobs
