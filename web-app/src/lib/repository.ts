import {
  followingProfiles,
  goals,
  integrations,
  onboardingQuestions,
  progressMetrics,
  progressNotes,
  socialFeed,
  trainingBlocks,
  weeklyPlan,
  workoutLibrary
} from "@/lib/mock-data";

export async function getDashboardSnapshot() {
  return {
    activeGoal: goals[2],
    weeklyPlan,
    progressMetrics,
    integrations
  };
}

export async function getOnboardingData() {
  return {
    questions: onboardingQuestions,
    goals
  };
}

export async function getPlanData() {
  return {
    activeGoal: goals[2],
    weeklyPlan,
    trainingBlocks
  };
}

export async function getTrainData() {
  return {
    todaySession: weeklyPlan.find((session) => session.status === "Today") ?? weeklyPlan[0],
    workoutLibrary
  };
}

export async function getProgressData() {
  return {
    metrics: progressMetrics,
    notes: progressNotes
  };
}

export async function getSocialData() {
  return {
    feed: socialFeed,
    following: followingProfiles
  };
}
