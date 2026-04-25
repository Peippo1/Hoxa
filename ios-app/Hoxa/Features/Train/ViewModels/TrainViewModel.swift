import Foundation

struct TrainViewModel {
    let appModel: AppModel

    var currentUser: DemoUser {
        appModel.currentUser
    }

    var todaySession: TrainingSession {
        appModel.todaySession
    }

    var workoutLibrary: [WorkoutTemplate] {
        appModel.workoutLibrary
    }

    var workoutDetail: DemoWorkoutDetail {
        appModel.workoutDetail
    }
}
