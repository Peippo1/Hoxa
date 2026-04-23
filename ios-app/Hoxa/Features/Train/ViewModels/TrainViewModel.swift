import Foundation

struct TrainViewModel {
    let appModel: AppModel

    var todaySession: TrainingSession {
        appModel.todaySession
    }

    var workoutLibrary: [WorkoutTemplate] {
        appModel.workoutLibrary
    }
}
