import Foundation

protocol MockDataProviding {
    func journey() -> DemoJourney
}

struct MockDataService: MockDataProviding {
    func journey() -> DemoJourney {
        .sample
    }
}
