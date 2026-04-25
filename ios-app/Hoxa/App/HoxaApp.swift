import SwiftUI

@main
struct HoxaApp: App {
    @StateObject private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            HoxaRootView(appModel: appModel)
        }
    }
}
