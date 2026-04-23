import Foundation
import Observation

@Observable
final class AppModel {
    var selectedGoal: Goal
    var goals: [Goal]
    var onboardingQuestions: [OnboardingQuestion]
    var trainingBlocks: [TrainingBlock]
    var weeklyPlan: [TrainingSession]
    var workoutLibrary: [WorkoutTemplate]
    var progressMetrics: [ProgressMetric]
    var progressNotes: [ProgressNote]
    var socialActivities: [SocialActivity]
    var followingProfiles: [FollowingProfile]
    var onboardingCompleted = false

    init(service: MockDataProviding = MockDataService()) {
        let goals = service.goals()
        self.goals = goals
        self.selectedGoal = goals.first ?? Goal.example
        self.onboardingQuestions = service.onboardingQuestions()
        self.trainingBlocks = service.trainingBlocks()
        self.weeklyPlan = service.weeklyPlan()
        self.workoutLibrary = service.workoutLibrary()
        self.progressMetrics = service.progressMetrics()
        self.progressNotes = service.progressNotes()
        self.socialActivities = service.socialActivities()
        self.followingProfiles = service.followingProfiles()
    }

    var todaySession: TrainingSession {
        weeklyPlan.first(where: { $0.status == .today }) ?? weeklyPlan.first ?? .example
    }
}
