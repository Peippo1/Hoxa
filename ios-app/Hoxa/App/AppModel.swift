import Combine
import Foundation

final class AppModel: ObservableObject {
    let journey: DemoJourney
    @Published var onboardingCompleted = false

    init(service: MockDataProviding = MockDataService()) {
        self.journey = service.journey()
    }

    var currentUser: DemoUser {
        journey.currentUser
    }

    var selectedGoal: Goal {
        journey.activeGoal
    }

    var goals: [Goal] {
        journey.goalOptions
    }

    var onboardingQuestions: [OnboardingQuestion] {
        journey.onboardingQuestions
    }

    var trainingBlocks: [TrainingBlock] {
        journey.trainingBlocks
    }

    var weeklyPlan: [TrainingSession] {
        journey.weeklyPlan
    }

    var workoutLibrary: [WorkoutTemplate] {
        journey.workoutLibrary
    }

    var workoutDetail: DemoWorkoutDetail {
        journey.workoutDetail
    }

    var progressMetrics: [ProgressMetric] {
        journey.progressMetrics
    }

    var progressNotes: [ProgressNote] {
        journey.progressNotes
    }

    var progressSummary: DemoProgressSummary {
        journey.progressSummary
    }

    var socialActivities: [SocialActivity] {
        journey.socialActivities
    }

    var followingProfiles: [FollowingProfile] {
        journey.followingProfiles
    }

    var socialSummary: DemoSocialSummary {
        journey.socialSummary
    }

    var todaySession: TrainingSession {
        journey.todaySession
    }
}
