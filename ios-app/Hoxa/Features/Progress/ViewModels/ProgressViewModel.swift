import Foundation

struct ProgressViewModel {
    let appModel: AppModel

    var metrics: [ProgressMetric] {
        appModel.progressMetrics
    }

    var notes: [ProgressNote] {
        appModel.progressNotes
    }
}
