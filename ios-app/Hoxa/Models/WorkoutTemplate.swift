import Foundation

struct WorkoutTemplate: Identifiable, Hashable {
    let id: String
    let title: String
    let category: String
    let duration: String
    let equipment: String
    let level: String
    let focus: String
}
