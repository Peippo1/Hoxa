import Foundation

struct TrainingSession: Identifiable, Hashable {
    enum SessionType: String {
        case running = "Running"
        case strength = "Strength"
        case mobility = "Mobility"
        case balance = "Balance"
        case recovery = "Recovery"
    }

    enum Status: String {
        case done = "Done"
        case today = "Today"
        case upcoming = "Upcoming"
        case moved = "Moved"
    }

    let id: String
    let day: String
    let title: String
    let sessionType: SessionType
    let duration: String
    let effort: String
    let location: String
    let reason: String
    let status: Status
    let rescheduleHint: String?

    static let example = TrainingSession(
        id: "session-1",
        day: "Thu",
        title: "Hips and ankles mobility reset",
        sessionType: .mobility,
        duration: "20 min",
        effort: "Gentle",
        location: "Home",
        reason: "Protects range of motion between the mid-week run and long run.",
        status: .today,
        rescheduleHint: "If work spills over, move this to Friday evening before cutting it."
    )
}
