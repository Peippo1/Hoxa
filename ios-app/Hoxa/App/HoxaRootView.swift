import SwiftUI

struct HoxaRootView: View {
    @ObservedObject var appModel: AppModel

    var body: some View {
        if appModel.onboardingCompleted {
            TabView {
                PlanView(appModel: appModel)
                    .tabItem {
                        Label("Plan", systemImage: "calendar")
                    }

                TrainView(appModel: appModel)
                    .tabItem {
                        Label("Train", systemImage: "figure.run")
                    }

                ProgressView(appModel: appModel)
                    .tabItem {
                        Label("Progress", systemImage: "chart.line.uptrend.xyaxis")
                    }

                SocialView(appModel: appModel)
                    .tabItem {
                        Label("Social", systemImage: "person.2")
                    }
            }
            .tint(Color.hoxaRosewood)
        } else {
            OnboardingView(appModel: appModel)
        }
    }
}

#if DEBUG
struct HoxaRootView_Previews: PreviewProvider {
    static var previews: some View {
        HoxaRootView(appModel: AppModel())
    }
}
#endif
