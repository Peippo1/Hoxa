import Foundation

struct ProgressMetric: Identifiable, Hashable {
    let id = UUID()
    let label: String
    let value: String
    let change: String
}
