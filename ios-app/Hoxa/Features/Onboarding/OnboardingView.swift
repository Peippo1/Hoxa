import SwiftUI

struct OnboardingView: View {
    @ObservedObject var appModel: AppModel

    private var viewModel: OnboardingViewModel {
        OnboardingViewModel(appModel: appModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("Demo journey")
                        .font(.caption)
                        .textCase(.uppercase)
                        .tracking(2.4)
                        .foregroundStyle(Color.hoxaRosewood.opacity(0.8))

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(viewModel.currentUser.displayName)
                                .font(.system(size: 34, weight: .semibold, design: .serif))
                                .foregroundStyle(Color.hoxaInk)

                            Text(viewModel.currentUser.role)
                                .font(.footnote)
                                .foregroundStyle(Color.hoxaRosewood)

                            Text(viewModel.title)
                                .font(.footnote)
                                .foregroundStyle(.secondary)

                            Text(viewModel.currentUser.story)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Starting goal")
                                .font(.headline)

                            Text(viewModel.activeGoal.title)
                                .font(.system(size: 28, weight: .semibold, design: .serif))
                                .foregroundStyle(Color.hoxaInk)

                            Text(viewModel.activeGoal.tagline)
                                .font(.footnote)
                                .foregroundStyle(.secondary)

                            Text("\(viewModel.activeGoal.targetDate) · \(viewModel.activeGoal.weeklyMix)")
                                .font(.caption)
                                .foregroundStyle(Color.hoxaRosewood)
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Core setup")
                                .font(.headline)

                            if viewModel.questions.isEmpty {
                                EmptyStateView(
                                    title: "Your setup is being prepared",
                                    message: "We’ll show the first few questions here as soon as the onboarding content is ready.",
                                    systemImage: "checklist"
                                )
                            } else {
                                ForEach(Array(viewModel.questions.enumerated()), id: \.element.id) { index, question in
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("Step \(index + 1) · \(question.label)")
                                            .font(.caption)
                                            .foregroundStyle(Color.hoxaRosewood)
                                        Text(question.prompt)
                                            .font(.subheadline.weight(.semibold))
                                        Text(question.options.joined(separator: " • "))
                                            .font(.footnote)
                                            .foregroundStyle(.secondary)
                                    }
                                    .padding(.vertical, 6)
                                }
                            }
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Goal options")
                                .font(.headline)

                            if viewModel.goalOptions.isEmpty {
                                EmptyStateView(
                                    title: "No starter goals yet",
                                    message: "A few suggested goals will appear here once the catalog is available.",
                                    systemImage: "flag"
                                )
                            } else {
                                ForEach(viewModel.goalOptions) { goal in
                                    VStack(alignment: .leading, spacing: 6) {
                                        HStack {
                                            Text(goal.title)
                                                .font(.subheadline.weight(.semibold))
                                            Spacer()
                                            Text(goal.targetDate)
                                                .font(.caption)
                                                .foregroundStyle(Color.hoxaRosewood)
                                        }
                                        Text(goal.tagline)
                                            .font(.footnote)
                                            .foregroundStyle(.secondary)
                                        Text(goal.weeklyMix)
                                            .font(.caption)
                                            .foregroundStyle(Color.hoxaRosewood)
                                    }
                                    .padding(.vertical, 6)
                                }
                            }
                        }
                    }

                    Button {
                        appModel.onboardingCompleted = true
                    } label: {
                        Text("Continue to this week")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.hoxaRosewood)
                }
                .padding(20)
            }
            .background(Color.hoxaCanvas.ignoresSafeArea())
            .navigationTitle("Get Started")
        }
    }
}

#if DEBUG
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(appModel: AppModel())
    }
}
#endif
