import Foundation

struct Goal: Identifiable, Hashable {
    enum GoalType: String {
        case fiveK = "5K"
        case tenK = "10K"
        case halfMarathon = "Half Marathon"
        case strength = "Strength"
        case consistency = "Consistency"
    }

    let id: String
    let goalType: GoalType
    let title: String
    let tagline: String
    let targetDate: String
    let weeklyMix: String

    static let example = Goal(
        id: "first-half",
        goalType: .halfMarathon,
        title: "Complete a first half marathon",
        tagline: "Build endurance while keeping strength and mobility consistent.",
        targetDate: "18 Oct 2026",
        weeklyMix: "3 runs / 2 strength / 1 mobility"
    )
}
