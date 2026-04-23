import SwiftUI

@main
struct HoxaApp: App {
    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            HoxaRootView(appModel: appModel)
        }
    }
}
