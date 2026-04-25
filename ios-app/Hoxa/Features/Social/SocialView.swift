import SwiftUI

struct SocialView: View {
    @ObservedObject var appModel: AppModel

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

                            Text(viewModel.summary.headline)
                                .font(.system(size: 28, weight: .semibold, design: .serif))
                                .foregroundStyle(Color.hoxaInk)

                            Text(viewModel.summary.detail)
                                .font(.footnote)
                                .foregroundStyle(.secondary)

                            Text("\(viewModel.summary.friendsCount) friends · \(viewModel.summary.propsCount) props this week")
                                .font(.caption)
                                .foregroundStyle(Color.hoxaRosewood)
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Following")
                                .font(.headline)

                            if viewModel.following.isEmpty {
                                EmptyStateView(
                                    title: "No one is in your circle yet",
                                    message: "Follow a few people to fill this list with supportive training updates.",
                                    systemImage: "person.2"
                                )
                            } else {
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
                    }

                    if viewModel.activities.isEmpty {
                        EmptyStateView(
                            title: "No activity yet",
                            message: "Updates from your circle will appear here once people start posting.",
                            systemImage: "heart.text.square"
                        )
                    } else {
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
                }
                .padding(20)
            }
            .background(Color.hoxaCanvas.ignoresSafeArea())
            .navigationTitle("Social")
        }
    }
}

#if DEBUG
struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView(appModel: AppModel())
    }
}
#endif
