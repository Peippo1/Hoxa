GOALS = [
    {
        "id": "goal-10k-pace",
        "title": "Run a 10K at 5:25/km",
        "goal_type": "running",
        "target_date": "2026-09-20",
        "tagline": "Two quality runs, two strength sessions, one mobility reset.",
        "weekly_mix": "2 runs / 2 strength / 1 mobility",
    },
    {
        "id": "goal-first-half",
        "title": "Complete a first half marathon",
        "goal_type": "half_marathon",
        "target_date": "2026-10-18",
        "tagline": "Build endurance without sacrificing strength and recovery.",
        "weekly_mix": "3 runs / 2 strength / 1 mobility",
    },
    {
        "id": "goal-general-fitness",
        "title": "Train consistently around work and life",
        "goal_type": "general_fitness",
        "target_date": None,
        "tagline": "A balanced training rhythm that remains realistic week to week.",
        "weekly_mix": "2 runs / 2 strength / 1 recovery",
    },
]

CURRENT_PLAN = {
    "id": "plan-half-marathon-foundation",
    "goal_id": "goal-first-half",
    "week_of": "2026-04-27",
    "headline": "Foundation week with one long run, two strength sessions, and protected mobility.",
    "focus": [
        "Maintain two easy-effort run exposures",
        "Rebuild lower-body strength",
        "Keep mobility visible after hard days",
    ],
    "sessions": [
        {
            "id": "session-1",
            "day": "Monday",
            "title": "Upper Body Strength Builder",
            "session_type": "strength",
            "duration_minutes": 45,
            "effort": "moderate",
            "location": "gym",
            "status": "done",
            "reason": "Supports posture and arm drive for running while building upper-body confidence.",
        },
        {
            "id": "session-2",
            "day": "Tuesday",
            "title": "Easy 6K with relaxed strides",
            "session_type": "running",
            "duration_minutes": 40,
            "effort": "easy",
            "location": "outdoors",
            "status": "done",
            "reason": "Maintains aerobic consistency without adding too much fatigue.",
        },
        {
            "id": "session-3",
            "day": "Thursday",
            "title": "Hips, ankles, and thoracic reset",
            "session_type": "mobility",
            "duration_minutes": 20,
            "effort": "gentle",
            "location": "home",
            "status": "today",
            "reason": "Protects range of motion between the mid-week run and long run.",
        },
        {
            "id": "session-4",
            "day": "Saturday",
            "title": "Long run progression",
            "session_type": "running",
            "duration_minutes": 70,
            "effort": "steady",
            "location": "outdoors",
            "status": "upcoming",
            "reason": "Primary endurance session for the half marathon goal.",
        },
        {
            "id": "session-5",
            "day": "Sunday",
            "title": "Lower Body Stability Circuit",
            "session_type": "strength",
            "duration_minutes": 35,
            "effort": "moderate",
            "location": "home",
            "status": "upcoming",
            "reason": "Improves balance, joint control, and resilience around long-run volume.",
        },
    ],
    "adjustment_rules": [
        "If Tuesday run is missed, move it to Wednesday before removing mobility.",
        "If long run is missed, shorten Sunday strength and move long run to Sunday morning.",
        "Keep at least one recovery or mobility slot after the longest weekly session.",
    ],
}

WORKOUT_LIBRARY = [
    {
        "id": "tempo-ladder",
        "title": "Tempo Ladder Run",
        "category": "running",
        "duration_minutes": 42,
        "equipment": "Watch optional",
        "level": "Beginner to Intermediate",
    },
    {
        "id": "upper-body-strength",
        "title": "Upper Body Strength Builder",
        "category": "strength",
        "duration_minutes": 45,
        "equipment": "Dumbbells or gym",
        "level": "Beginner",
    },
    {
        "id": "balance-flow",
        "title": "Home Core and Balance Flow",
        "category": "balance",
        "duration_minutes": 18,
        "equipment": "Mat",
        "level": "All levels",
    },
    {
        "id": "mobility-reset",
        "title": "Mobility Reset for Runners",
        "category": "mobility",
        "duration_minutes": 20,
        "equipment": "Mat",
        "level": "All levels",
    },
]

PROGRESS_METRICS = [
    {"label": "Sessions completed", "value": "17", "change": "+4 vs last week"},
    {"label": "Training balance", "value": "82%", "change": "Mobility now on target"},
    {"label": "10K readiness", "value": "Base+", "change": "Long-run confidence improving"},
]

SOCIAL_FEED = [
    {
        "id": "maya",
        "name": "Maya Thompson",
        "action": "finished a steady 8K",
        "detail": "Kept it conversational and added 5 minutes of calf mobility after.",
        "props": 18,
    },
    {
        "id": "elliot",
        "name": "Elliot Shaw",
        "action": "logged a chest and shoulders session",
        "detail": "Shortened the workout to fit lunch break and still kept the key lifts.",
        "props": 11,
    },
    {
        "id": "harper",
        "name": "Harper Reed",
        "action": "completed a balance flow",
        "detail": "First week staying consistent with mobility after every run.",
        "props": 9,
    },
]

INTEGRATIONS = [
    {
        "provider": "Apple Health",
        "status": "planned",
        "notes": "HealthKit workout history adapter placeholder.",
    },
    {
        "provider": "Apple Calendar",
        "status": "planned",
        "notes": "Availability and write-back adapter placeholder.",
    },
    {
        "provider": "Google Calendar",
        "status": "planned",
        "notes": "Calendar availability adapter placeholder.",
    },
    {
        "provider": "Garmin",
        "status": "planned",
        "notes": "Imported workout history adapter placeholder.",
    },
]
