import SwiftUI

struct HoxaRootView: View {
    let appModel: AppModel

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

#Preview {
    HoxaRootView(appModel: AppModel())
}
