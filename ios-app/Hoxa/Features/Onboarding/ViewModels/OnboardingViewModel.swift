import Foundation

struct OnboardingViewModel {
    let appModel: AppModel

    var title: String {
        "Start with a goal, your current level, and the constraints that shape real life."
    }

    var questions: [OnboardingQuestion] {
        appModel.onboardingQuestions
    }

    var goals: [Goal] {
        appModel.goals
    }
}
