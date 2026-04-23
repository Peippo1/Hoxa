import SwiftUI

struct SocialView: View {
    @Bindable var appModel: AppModel

    private var viewModel: SocialViewModel {
        SocialViewModel(appModel: appModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HoxaCard {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Supportive social")
                                .font(.caption)
                                .tracking(2)
                                .foregroundStyle(Color.hoxaRosewood)
                            Text("Follow a small circle, give props quickly, and keep the tone encouraging.")
                                .font(.system(size: 28, weight: .semibold, design: .serif))
                                .foregroundStyle(Color.hoxaInk)
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Following")
                                .font(.headline)

                            ForEach(viewModel.following) { profile in
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(profile.name)
                                            .font(.subheadline.weight(.semibold))
                                        Text(profile.focus)
                                            .font(.footnote)
                                            .foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                    Text(profile.streak)
                                        .font(.caption)
                                        .foregroundStyle(Color.hoxaRosewood)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }

                    ForEach(viewModel.activities) { activity in
                        HoxaCard {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("\(activity.name) \(activity.action)")
                                            .font(.subheadline.weight(.semibold))
                                        Text(activity.detail)
                                            .font(.footnote)
                                            .foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                    Text("\(activity.props) props")
                                        .font(.caption)
                                        .foregroundStyle(Color.hoxaRosewood)
                                }

                                Text(activity.visibility.rawValue)
                                    .font(.caption)
                                    .foregroundStyle(Color.hoxaInk.opacity(0.55))
                            }
                        }
                    }
                }
                .padding(20)
            }
            .background(Color.hoxaCanvas.ignoresSafeArea())
            .navigationTitle("Social")
        }
    }
}

#Preview {
    SocialView(appModel: AppModel())
}
