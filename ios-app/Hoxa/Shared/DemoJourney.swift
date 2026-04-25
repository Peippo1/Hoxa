import Foundation

struct DemoUser: Hashable {
    let displayName: String
    let role: String
    let story: String
}

struct DemoWorkoutDetail: Hashable {
    let title: String
    let objective: String
    let cues: [String]
    let fallback: String
}

struct DemoProgressSummary: Hashable {
    let headline: String
    let detail: String
    let nextStep: String
}

struct DemoSocialSummary: Hashable {
    let headline: String
    let detail: String
    let friendsCount: Int
    let propsCount: Int
}

struct DemoJourney: Hashable {
    let currentUser: DemoUser
    let activeGoal: Goal
    let goalOptions: [Goal]
    let onboardingQuestions: [OnboardingQuestion]
    let trainingBlocks: [TrainingBlock]
    let weeklyPlan: [TrainingSession]
    let workoutLibrary: [WorkoutTemplate]
    let workoutDetail: DemoWorkoutDetail
    let progressMetrics: [ProgressMetric]
    let progressNotes: [ProgressNote]
    let progressSummary: DemoProgressSummary
    let socialActivities: [SocialActivity]
    let followingProfiles: [FollowingProfile]
    let socialSummary: DemoSocialSummary

    var todaySession: TrainingSession {
        weeklyPlan.first(where: { $0.status == .today }) ?? weeklyPlan.first ?? .example
    }

    static let sample: DemoJourney = {
        let activeGoal = Goal(
            id: "10k-pace",
            goalType: .tenK,
            title: "Run a 10K at 5:25/km",
            tagline: "Two quality runs, two strength sessions, one mobility reset.",
            targetDate: "20 Sep 2026",
            weeklyMix: "2 runs / 2 strength / 1 mobility"
        )

        return DemoJourney(
            currentUser: DemoUser(
                displayName: "Avery Chen",
                role: "Returning runner",
                story: "Training around a busy work week without losing momentum."
            ),
            activeGoal: activeGoal,
            goalOptions: [
                activeGoal,
                Goal(
                    id: "first-half",
                    goalType: .halfMarathon,
                    title: "Complete a first half marathon",
                    tagline: "Build endurance while keeping strength and mobility consistent.",
                    targetDate: "18 Oct 2026",
                    weeklyMix: "3 runs / 2 strength / 1 mobility"
                ),
                Goal(
                    id: "general-fitness",
                    goalType: .consistency,
                    title: "Train consistently around work and life",
                    tagline: "A balanced training rhythm that remains realistic week to week.",
                    targetDate: "Ongoing",
                    weeklyMix: "2 runs / 2 strength / 1 recovery"
                )
            ],
            onboardingQuestions: [
                OnboardingQuestion(
                    id: "goal",
                    label: "Goal",
                    prompt: "Select the outcome that matters most right now.",
                    options: ["First 5K", "Faster 10K", "First half marathon", "Upper body strength", "Better consistency"]
                ),
                OnboardingQuestion(
                    id: "level",
                    label: "Fitness level",
                    prompt: "Keep the plan realistic for where the user is today.",
                    options: ["New to structured training", "Returning after a break", "Beginner", "Intermediate"]
                ),
                OnboardingQuestion(
                    id: "equipment",
                    label: "Equipment",
                    prompt: "Session suggestions should respect real-world equipment limits.",
                    options: ["Mat", "Bands", "Dumbbells", "Gym access", "No equipment"]
                )
            ],
            trainingBlocks: [
                TrainingBlock(
                    id: "foundation",
                    title: "Foundation",
                    window: "Weeks 1-4",
                    summary: "Build rhythm, reinforce mobility, and establish the baseline weekly mix."
                ),
                TrainingBlock(
                    id: "build",
                    title: "Build",
                    window: "Weeks 5-8",
                    summary: "Increase anchor session quality while keeping support work stable."
                ),
                TrainingBlock(
                    id: "steady",
                    title: "Steady confidence",
                    window: "Weeks 9-10",
                    summary: "Hold consistency and avoid overloading the last block."
                )
            ],
            weeklyPlan: [
                TrainingSession(
                    id: "mon",
                    day: "Mon",
                    title: "Upper Body Strength Builder",
                    sessionType: .strength,
                    duration: "45 min",
                    effort: "Moderate",
                    location: "Gym",
                    reason: "Supports posture and arm drive for running while building upper-body confidence.",
                    status: .done,
                    rescheduleHint: nil
                ),
                TrainingSession(
                    id: "tue",
                    day: "Tue",
                    title: "Easy 6K with relaxed strides",
                    sessionType: .running,
                    duration: "40 min",
                    effort: "Easy",
                    location: "Outdoors",
                    reason: "Maintains aerobic consistency without adding too much fatigue.",
                    status: .done,
                    rescheduleHint: nil
                ),
                TrainingSession(
                    id: "thu",
                    day: "Thu",
                    title: "Hips and ankles mobility reset",
                    sessionType: .mobility,
                    duration: "20 min",
                    effort: "Gentle",
                    location: "Home",
                    reason: "Protects range of motion between the mid-week run and long run.",
                    status: .today,
                    rescheduleHint: "If work runs late, trim the session to the first two movements."
                ),
                TrainingSession(
                    id: "sat",
                    day: "Sat",
                    title: "Long run progression",
                    sessionType: .running,
                    duration: "70 min",
                    effort: "Steady",
                    location: "Outdoors",
                    reason: "Primary endurance session for the half marathon goal.",
                    status: .upcoming,
                    rescheduleHint: nil
                ),
                TrainingSession(
                    id: "sun",
                    day: "Sun",
                    title: "Lower Body Stability Circuit",
                    sessionType: .strength,
                    duration: "35 min",
                    effort: "Moderate",
                    location: "Home",
                    reason: "Improves balance, joint control, and resilience around long-run volume.",
                    status: .moved,
                    rescheduleHint: "Moved later to preserve recovery spacing after the long run."
                )
            ],
            workoutLibrary: [
                WorkoutTemplate(
                    id: "tempo",
                    title: "Tempo Ladder Run",
                    category: "Running",
                    duration: "42 min",
                    equipment: "Watch optional",
                    level: "Beginner to Intermediate",
                    focus: "Pace confidence"
                ),
                WorkoutTemplate(
                    id: "upper-strength",
                    title: "Upper Body Strength Builder",
                    category: "Strength",
                    duration: "45 min",
                    equipment: "Dumbbells or gym",
                    level: "Beginner",
                    focus: "Chest, shoulders, posture"
                ),
                WorkoutTemplate(
                    id: "balance-flow",
                    title: "Home Core and Balance Flow",
                    category: "Balance",
                    duration: "18 min",
                    equipment: "Mat",
                    level: "All levels",
                    focus: "Single-leg stability"
                ),
                WorkoutTemplate(
                    id: "mobility-reset",
                    title: "Mobility Reset for Runners",
                    category: "Mobility",
                    duration: "20 min",
                    equipment: "Mat",
                    level: "All levels",
                    focus: "Hips, ankles, thoracic spine"
                )
            ],
            workoutDetail: DemoWorkoutDetail(
                title: "Workout detail for today",
                objective: "Keep the body fresh for the mid-week run and the weekend long run.",
                cues: [
                    "Move smoothly and keep the breathing easy.",
                    "Spend a little longer on the stiffest side.",
                    "Finish with a short walk to lock in the recovery."
                ],
                fallback: "If the day gets crowded, do the first two movements and keep the habit alive."
            ),
            progressMetrics: [
                ProgressMetric(label: "Completed this month", value: "17", change: "+4 vs last month"),
                ProgressMetric(label: "Weekly consistency", value: "82%", change: "Mobility now back on target"),
                ProgressMetric(label: "10K pace trend", value: "-18s/km", change: "Easy run pace improving")
            ],
            progressNotes: [
                ProgressNote(
                    id: "balance",
                    title: "Training balance",
                    detail: "Running and strength frequency are stable, and mobility is no longer being dropped first."
                ),
                ProgressNote(
                    id: "flow",
                    title: "Weekly flow",
                    detail: "The week is arranged so the hard work has space to settle before the long run."
                ),
                ProgressNote(
                    id: "strength",
                    title: "Strength progression",
                    detail: "Upper-body sessions are trending up in volume while weekday session length stays realistic."
                )
            ],
            progressSummary: DemoProgressSummary(
                headline: "This week is 4 of 5 sessions complete.",
                detail: "Avery is keeping the plan realistic, and the mobility work stayed in instead of getting squeezed out.",
                nextStep: "Finish the long run, then protect Sunday for a lighter strength session."
            ),
            socialActivities: [
                SocialActivity(
                    id: "maya",
                    name: "Maya Thompson",
                    action: "finished a steady 8K",
                    detail: "Kept it conversational and added 5 minutes of calf mobility after.",
                    props: 18,
                    visibility: .friends
                ),
                SocialActivity(
                    id: "elliot",
                    name: "Elliot Shaw",
                    action: "logged a chest and shoulders session",
                    detail: "Shortened the workout to fit lunch break and still kept the key lifts.",
                    props: 11,
                    visibility: .followers
                ),
                SocialActivity(
                    id: "harper",
                    name: "Harper Reed",
                    action: "completed a balance flow",
                    detail: "First week staying consistent with mobility after every run.",
                    props: 9,
                    visibility: .friends
                )
            ],
            followingProfiles: [
                FollowingProfile(id: "maya-following", name: "Maya Thompson", focus: "First half marathon", streak: "12-day streak"),
                FollowingProfile(id: "elliot-following", name: "Elliot Shaw", focus: "Upper-body strength", streak: "7-day streak"),
                FollowingProfile(id: "harper-following", name: "Harper Reed", focus: "Mobility and balance", streak: "5-day streak")
            ],
            socialSummary: DemoSocialSummary(
                headline: "Three friends, 38 props this week, and a steady training circle.",
                detail: "The feed is quiet enough to feel focused, but active enough to keep motivation moving.",
                friendsCount: 3,
                propsCount: 38
            )
        )
    }()
}
