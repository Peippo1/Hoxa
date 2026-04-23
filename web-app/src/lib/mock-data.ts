import type {
  FollowingProfile,
  Goal,
  IntegrationPlaceholder,
  OnboardingQuestion,
  PlanSession,
  ProgressMetric,
  ProgressNote,
  SocialActivity,
  TrainingBlock,
  WorkoutLibraryItem
} from "@/lib/types";

export const goals: Goal[] = [
  {
    id: "goal-5k",
    type: "5k",
    title: "Finish a first 5K comfortably",
    targetDate: "12 Jul 2026",
    tagline: "Build confidence with two runs, light strength, and one mobility reset.",
    weeklyMix: "2 runs / 2 strength / 1 mobility"
  },
  {
    id: "goal-10k",
    type: "10k",
    title: "Run a faster 10K at 5:25/km",
    targetDate: "20 Sep 2026",
    tagline: "Two focused runs, two strength sessions, and enough recovery to stay consistent.",
    weeklyMix: "2 runs / 2 strength / 1 mobility"
  },
  {
    id: "goal-half",
    type: "half_marathon",
    title: "Complete a first half marathon",
    targetDate: "18 Oct 2026",
    tagline: "Build endurance while keeping strength and movement quality intact.",
    weeklyMix: "3 runs / 2 strength / 1 mobility"
  },
  {
    id: "goal-strength",
    type: "strength",
    title: "Build upper body and chest strength",
    targetDate: "Ongoing",
    tagline: "Prioritise progressive upper-body work while keeping one run and one mobility slot.",
    weeklyMix: "3 strength / 1 run / 1 mobility"
  }
];

export const onboardingQuestions: OnboardingQuestion[] = [
  {
    id: "goal",
    label: "Goal",
    prompt: "Select the outcome that matters most right now.",
    selections: ["First 5K", "Faster 10K", "First half marathon", "Upper body strength", "Better consistency"]
  },
  {
    id: "level",
    label: "Fitness level",
    prompt: "Keep the plan realistic for where the user is today.",
    selections: ["New to structured training", "Returning after a break", "Beginner", "Intermediate"]
  },
  {
    id: "types",
    label: "Training types",
    prompt: "Let users combine modalities instead of forcing a single lane.",
    selections: ["Running", "Gym strength", "Home workouts", "Mobility", "Balance"]
  },
  {
    id: "equipment",
    label: "Equipment",
    prompt: "Session suggestions should respect real constraints.",
    selections: ["Mat", "Resistance bands", "Dumbbells", "Gym access", "No equipment"]
  },
  {
    id: "days",
    label: "Preferred days",
    prompt: "The planner should know where training can actually fit.",
    selections: ["Mon", "Tue", "Thu", "Sat", "Sun"]
  },
  {
    id: "constraints",
    label: "Schedule constraints",
    prompt: "Short lunch windows and busy weekends should influence the plan.",
    selections: ["Short weekday sessions", "Travel days", "Long run on weekends", "Evening only"]
  }
];

export const trainingBlocks: TrainingBlock[] = [
  {
    id: "foundation",
    title: "Foundation",
    window: "Weeks 1–4",
    summary: "Set rhythm, reinforce mobility, and establish the minimum viable weekly mix."
  },
  {
    id: "build",
    title: "Build",
    window: "Weeks 5–8",
    summary: "Increase the quality of anchor sessions while keeping support work steady."
  },
  {
    id: "steady",
    title: "Steady confidence",
    window: "Weeks 9–10",
    summary: "Hold consistency and avoid squeezing too much into the final block."
  }
];

export const weeklyPlan: PlanSession[] = [
  {
    id: "monday",
    day: "Mon",
    title: "Upper Body Strength Builder",
    sessionType: "Strength",
    duration: "45 min",
    effort: "Moderate",
    status: "Done",
    location: "Gym",
    reason: "Supports posture and arm drive for running while progressing upper-body strength."
  },
  {
    id: "tuesday",
    day: "Tue",
    title: "Easy 6K with relaxed strides",
    sessionType: "Running",
    duration: "40 min",
    effort: "Easy",
    status: "Done",
    location: "Outdoors",
    reason: "Maintains aerobic consistency without adding too much fatigue."
  },
  {
    id: "thursday",
    day: "Thu",
    title: "Hips and ankles mobility reset",
    sessionType: "Mobility",
    duration: "20 min",
    effort: "Gentle",
    status: "Today",
    location: "Home",
    reason: "Protects range of motion between the mid-week run and long run.",
    rescheduleHint: "If work spills over, move this to Friday evening before cutting it."
  },
  {
    id: "saturday",
    day: "Sat",
    title: "Long run progression",
    sessionType: "Running",
    duration: "70 min",
    effort: "Steady",
    status: "Upcoming",
    location: "Outdoors",
    reason: "Primary endurance session for the half marathon goal."
  },
  {
    id: "sunday",
    day: "Sun",
    title: "Lower Body Stability Circuit",
    sessionType: "Strength",
    duration: "35 min",
    effort: "Moderate",
    status: "Moved",
    location: "Home",
    reason: "Improves balance, joint control, and resilience around long-run volume.",
    rescheduleHint: "Moved later to preserve recovery spacing after the long run."
  }
];

export const workoutLibrary: WorkoutLibraryItem[] = [
  {
    id: "run-tempo",
    title: "Tempo Ladder Run",
    category: "Running",
    duration: "42 min",
    equipment: "Watch optional",
    level: "Beginner to Intermediate",
    focus: "Pace confidence"
  },
  {
    id: "upper-strength",
    title: "Upper Body Strength Builder",
    category: "Strength",
    duration: "45 min",
    equipment: "Dumbbells or gym",
    level: "Beginner",
    focus: "Chest, shoulders, posture"
  },
  {
    id: "home-core",
    title: "Home Core and Balance Flow",
    category: "Balance",
    duration: "18 min",
    equipment: "Mat",
    level: "All levels",
    focus: "Single-leg stability"
  },
  {
    id: "mobility-reset",
    title: "Mobility Reset for Runners",
    category: "Mobility",
    duration: "20 min",
    equipment: "Mat",
    level: "All levels",
    focus: "Hips, ankles, thoracic spine"
  }
];

export const progressMetrics: ProgressMetric[] = [
  {
    label: "Completed this month",
    value: "17",
    change: "+4 vs last month"
  },
  {
    label: "Weekly consistency",
    value: "82%",
    change: "Mobility now back on target"
  },
  {
    label: "10K pace trend",
    value: "-18s/km",
    change: "Easy run pace improving"
  }
];

export const progressNotes: ProgressNote[] = [
  {
    id: "balance",
    title: "Training balance",
    detail: "Running and strength frequency are stable, and mobility is no longer being dropped first."
  },
  {
    id: "history",
    title: "Future import history",
    detail: "Workout history architecture should absorb Apple Health and Garmin runs without changing UI concepts."
  },
  {
    id: "strength",
    title: "Strength progression",
    detail: "Upper-body sessions are trending up in volume while session length stays realistic for weekdays."
  }
];

export const socialFeed: SocialActivity[] = [
  {
    id: "maya",
    name: "Maya Thompson",
    action: "finished a steady 8K",
    detail: "Kept it conversational and added 5 minutes of calf mobility after.",
    props: 18,
    visibility: "friends"
  },
  {
    id: "elliot",
    name: "Elliot Shaw",
    action: "logged a chest and shoulders session",
    detail: "Shortened the workout to fit lunch break and still kept the key lifts.",
    props: 11,
    visibility: "followers"
  },
  {
    id: "harper",
    name: "Harper Reed",
    action: "completed a balance flow",
    detail: "First week staying consistent with mobility after every run.",
    props: 9,
    visibility: "friends"
  }
];

export const followingProfiles: FollowingProfile[] = [
  {
    id: "maya-following",
    name: "Maya Thompson",
    focus: "First half marathon",
    streak: "12-day streak"
  },
  {
    id: "elliot-following",
    name: "Elliot Shaw",
    focus: "Upper-body strength",
    streak: "7-day streak"
  },
  {
    id: "harper-following",
    name: "Harper Reed",
    focus: "Mobility and balance",
    streak: "5-day streak"
  }
];

export const integrations: IntegrationPlaceholder[] = [
  {
    provider: "Apple Health / Apple Watch",
    state: "Mock Ready",
    note: "History import and readiness placeholders are represented in the product model."
  },
  {
    provider: "Google Calendar",
    state: "Mock Ready",
    note: "Availability-aware plan placement is modelled before real provider work begins."
  },
  {
    provider: "Apple Calendar / iCal",
    state: "Planned",
    note: "Write-back and availability adapters should follow the same scheduling interface."
  },
  {
    provider: "Garmin",
    state: "Planned",
    note: "Read-only history import should come before deeper sync logic."
  }
];
