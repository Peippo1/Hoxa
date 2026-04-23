export type GoalType =
  | "5k"
  | "10k"
  | "half_marathon"
  | "strength"
  | "general_fitness"
  | "mobility";

export type SessionType = "Running" | "Strength" | "Mobility" | "Balance" | "Recovery";
export type SessionStatus = "Done" | "Today" | "Upcoming" | "Moved";

export type Goal = {
  id: string;
  type: GoalType;
  title: string;
  targetDate: string;
  tagline: string;
  weeklyMix: string;
};

export type OnboardingQuestion = {
  id: string;
  label: string;
  prompt: string;
  selections: string[];
};

export type PlanSession = {
  id: string;
  day: string;
  title: string;
  sessionType: SessionType;
  duration: string;
  effort: string;
  status: SessionStatus;
  location: string;
  reason: string;
  rescheduleHint?: string;
};

export type TrainingBlock = {
  id: string;
  title: string;
  window: string;
  summary: string;
};

export type WorkoutLibraryItem = {
  id: string;
  title: string;
  category: string;
  duration: string;
  equipment: string;
  level: string;
  focus: string;
};

export type ProgressMetric = {
  label: string;
  value: string;
  change: string;
};

export type ProgressNote = {
  id: string;
  title: string;
  detail: string;
};

export type SocialActivity = {
  id: string;
  name: string;
  action: string;
  detail: string;
  props: number;
  visibility: "friends" | "followers";
};

export type FollowingProfile = {
  id: string;
  name: string;
  focus: string;
  streak: string;
};

export type IntegrationPlaceholder = {
  provider: string;
  state: "Planned" | "Mock Ready";
  note: string;
};
