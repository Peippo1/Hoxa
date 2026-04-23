import Foundation

struct PlanViewModel {
    let appModel: AppModel

    var selectedGoal: Goal {
        appModel.selectedGoal
    }

    var weeklyPlan: [TrainingSession] {
        appModel.weeklyPlan
    }

    var trainingBlocks: [TrainingBlock] {
        appModel.trainingBlocks
    }

    var adaptiveRules: [String] {
        [
            "Move easier sessions before deleting them when a day is missed.",
            "Protect one recovery or mobility slot after the longest weekly effort.",
            "Keep strength frequency steady even during run-focused blocks.",
            "Respect weekday time limits before increasing session volume."
        ]
    }
}
