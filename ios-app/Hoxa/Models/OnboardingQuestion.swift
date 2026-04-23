import Foundation

struct OnboardingQuestion: Identifiable, Hashable {
    let id: String
    let label: String
    let prompt: String
    let options: [String]
}
