import SwiftUI

struct OnboardingView: View {
    @Bindable var appModel: AppModel

    private var viewModel: OnboardingViewModel {
        OnboardingViewModel(appModel: appModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("Onboarding")
                        .font(.caption)
                        .textCase(.uppercase)
                        .tracking(2.4)
                        .foregroundStyle(Color.hoxaRosewood.opacity(0.8))

                    Text(viewModel.title)
                        .font(.system(size: 34, weight: .semibold, design: .serif))
                        .foregroundStyle(Color.hoxaInk)

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Core setup")
                                .font(.headline)

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

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Starter goals")
                                .font(.headline)

                            ForEach(viewModel.goals) { goal in
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

                    Button {
                        appModel.onboardingCompleted = true
                    } label: {
                        Text("Continue with sample setup")
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

#Preview {
    OnboardingView(appModel: AppModel())
}
