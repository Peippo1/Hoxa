import Foundation

struct OnboardingViewModel {
    let appModel: AppModel

    var title: String {
        "Start with a clear goal, a realistic week, and the constraints that shape real life."
    }

    var currentUser: DemoUser {
        appModel.currentUser
    }

    var activeGoal: Goal {
        appModel.selectedGoal
    }

    var questions: [OnboardingQuestion] {
        appModel.onboardingQuestions
    }

    var goalOptions: [Goal] {
        appModel.goals
    }
}
