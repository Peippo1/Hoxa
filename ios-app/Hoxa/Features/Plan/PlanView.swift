import SwiftUI

struct PlanView: View {
    @Bindable var appModel: AppModel

    private var viewModel: PlanViewModel {
        PlanViewModel(appModel: appModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    header

                    ForEach(viewModel.weeklyPlan) { session in
                        HoxaCard {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Text(session.day.uppercased())
                                        .font(.caption)
                                        .tracking(1.8)
                                        .foregroundStyle(.secondary)
                                    Spacer()
                                    Text(session.status.rawValue)
                                        .font(.caption.weight(.medium))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .background(statusColor(for: session.status))
                                        .clipShape(Capsule())
                                }

                                Text(session.title)
                                    .font(.system(size: 28, weight: .semibold, design: .serif))
                                    .foregroundStyle(Color.hoxaInk)

                                Text("\(session.sessionType.rawValue) • \(session.duration) • \(session.effort) • \(session.location)")
                                    .font(.footnote)
                                    .foregroundStyle(Color.hoxaRosewood)

                                Text(session.reason)
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)

                                if let rescheduleHint = session.rescheduleHint {
                                    Text(rescheduleHint)
                                        .font(.footnote)
                                        .foregroundStyle(Color.hoxaInk.opacity(0.7))
                                        .padding(10)
                                        .background(Color.hoxaSage.opacity(0.8))
                                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                }
                            }
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Training Blocks")
                                .font(.headline)

                            ForEach(viewModel.trainingBlocks) { block in
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(block.window)
                                        .font(.caption)
                                        .foregroundStyle(Color.hoxaRosewood)
                                    Text(block.title)
                                        .font(.subheadline.weight(.semibold))
                                    Text(block.summary)
                                        .font(.footnote)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                }
                .padding(20)
            }
            .background(Color.hoxaCanvas.ignoresSafeArea())
            .navigationTitle("Plan")
        }
    }

    private var header: some View {
        HoxaCard {
            VStack(alignment: .leading, spacing: 12) {
                Text("Adaptive Week")
                    .font(.caption)
                    .tracking(2)
                    .foregroundStyle(Color.hoxaRosewood)

                Text(viewModel.selectedGoal.title)
                    .font(.system(size: 30, weight: .semibold, design: .serif))
                    .foregroundStyle(Color.hoxaInk)

                Text(viewModel.selectedGoal.tagline)
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                Text("If a day gets missed, easier sessions move before they disappear.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private func statusColor(for status: TrainingSession.Status) -> Color {
        switch status {
        case .done:
            return .hoxaMint.opacity(0.9)
        case .today:
            return .hoxaBlush.opacity(0.25)
        case .upcoming:
            return .hoxaSage.opacity(0.9)
        case .moved:
            return .hoxaInk.opacity(0.9)
        }
    }
}

#Preview {
    PlanView(appModel: AppModel())
}
