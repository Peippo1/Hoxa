import Foundation

struct ProgressViewModel {
    let appModel: AppModel

    var currentUser: DemoUser {
        appModel.currentUser
    }

    var activeGoal: Goal {
        appModel.selectedGoal
    }

    var metrics: [ProgressMetric] {
        appModel.progressMetrics
    }

    var notes: [ProgressNote] {
        appModel.progressNotes
    }

    var summary: DemoProgressSummary {
        appModel.progressSummary
    }
}
