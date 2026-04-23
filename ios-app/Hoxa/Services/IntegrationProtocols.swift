import Foundation

protocol WorkoutHistoryProvider {
    func recentWorkouts() async throws -> [TrainingSession]
}

protocol RecoverySignalProvider {
    func readinessSummary() async throws -> String
}

protocol AvailabilityProvider {
    func availableSlots() async throws -> [String]
}

protocol CalendarWriteProvider {
    func writePlannedSessions(_ sessions: [TrainingSession]) async throws
}

// These protocols keep the MVP source structure ready for HealthKit,
// Apple Watch, Garmin, Google Calendar, and Apple Calendar adapters later.
