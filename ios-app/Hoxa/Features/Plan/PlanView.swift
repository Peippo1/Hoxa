import SwiftUI

struct PlanView: View {
    @ObservedObject var appModel: AppModel
    @State private var planSessions: [TrainingSession]
    @State private var selectedAdjustmentSession: TrainingSession?
    @State private var adjustmentSummary: String?

    init(appModel: AppModel) {
        self.appModel = appModel
        _planSessions = State(initialValue: appModel.weeklyPlan)
    }

    private var viewModel: PlanViewModel {
        PlanViewModel(appModel: appModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("\(viewModel.currentUser.displayName)'s week")
                                .font(.caption)
                                .tracking(2)
                                .foregroundStyle(Color.hoxaRosewood)

                            Text(viewModel.selectedGoal.title)
                                .font(.system(size: 30, weight: .semibold, design: .serif))
                                .foregroundStyle(Color.hoxaInk)

                            Text(viewModel.selectedGoal.tagline)
                                .font(.footnote)
                                .foregroundStyle(.secondary)

                            Text(viewModel.currentUser.story)
                                .font(.footnote)
                                .foregroundStyle(Color.hoxaRosewood)
                        }
                    }

                    if let adjustmentSummary {
                        HoxaCard {
                            VStack(alignment: .leading, spacing: 8) {
                                Label(adjustmentSummary, systemImage: "sparkles")
                                    .font(.headline)
                                    .foregroundStyle(Color.hoxaInk)

                                Text("The rest of the week stays balanced around this change.")
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }

                    if planSessions.isEmpty {
                        EmptyStateView(
                            title: "No sessions scheduled yet",
                            message: "Your weekly plan will appear here once it is ready.",
                            systemImage: "calendar.badge.plus"
                        )
                    } else {
                        VStack(spacing: 12) {
                            ForEach(planSessions) { session in
                                PlanSessionCard(
                                    session: session,
                                    onAdjust: { selectedAdjustmentSession = session }
                                )
                            }
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Training Blocks")
                                .font(.headline)

                            if viewModel.trainingBlocks.isEmpty {
                                EmptyStateView(
                                    title: "Training blocks are on the way",
                                    message: "We’ll group the week into clear phases once the plan is ready.",
                                    systemImage: "square.grid.2x2"
                                )
                            } else {
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

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("How the week adapts")
                                .font(.headline)

                            ForEach(Array(viewModel.adaptiveRules.enumerated()), id: \.offset) { _, rule in
                                Text(rule)
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                }
                .padding(20)
            }
            .background(Color.hoxaCanvas.ignoresSafeArea())
            .navigationTitle("Plan")
            .sheet(item: $selectedAdjustmentSession) { session in
                PlanAdjustmentSheet(
                    session: session,
                    onMove: { applyAdjustment(.moveSession, to: session) },
                    onReduceIntensity: { applyAdjustment(.reduceIntensity, to: session) },
                    onSwapToRecovery: { applyAdjustment(.swapToRecovery, to: session) }
                )
            }
        }
    }

    private func applyAdjustment(_ choice: PlanAdjustmentChoice, to session: TrainingSession) {
        guard let index = planSessions.firstIndex(where: { $0.id == session.id }) else {
            return
        }

        let updatedSession: TrainingSession
        let summary: String

        switch choice {
        case .moveSession:
            updatedSession = session.movedForwardToNextDay()
            summary = "\(session.title) moved to \(updatedSession.day)."
        case .reduceIntensity:
            updatedSession = session.withReducedIntensity()
            summary = "\(session.title) is now a lighter version."
        case .swapToRecovery:
            updatedSession = session.withRecoverySwap()
            summary = "\(session.title) swapped to recovery work."
        }

        planSessions[index] = updatedSession
        adjustmentSummary = summary
    }
}

private enum PlanAdjustmentChoice {
    case moveSession
    case reduceIntensity
    case swapToRecovery
}

private struct PlanSessionCard: View {
    let session: TrainingSession
    let onAdjust: () -> Void

    var body: some View {
        HoxaCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(session.day.uppercased())
                            .font(.caption)
                            .tracking(1.8)
                            .foregroundStyle(.secondary)

                        Text(session.title)
                            .font(.system(size: 28, weight: .semibold, design: .serif))
                            .foregroundStyle(Color.hoxaInk)
                    }

                    Spacer()

                    Text(session.status.rawValue)
                        .font(.caption.weight(.medium))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(statusColor(for: session.status))
                        .clipShape(Capsule())
                }

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

                Button(action: onAdjust) {
                    Label("Missed this? Adjust", systemImage: "arrow.triangle.2.circlepath")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.hoxaInk)
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

private struct PlanAdjustmentSheet: View {
    let session: TrainingSession
    let onMove: () -> Void
    let onReduceIntensity: () -> Void
    let onSwapToRecovery: () -> Void
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Missed a session?")
                            .font(.system(size: 28, weight: .semibold, design: .serif))
                            .foregroundStyle(Color.hoxaInk)

                        Text("Hoxa can keep the week moving with a calmer version of this plan.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(session.day.uppercased())
                                .font(.caption)
                                .tracking(1.8)
                                .foregroundStyle(.secondary)

                            Text(session.title)
                                .font(.headline)

                            Text("\(session.sessionType.rawValue) • \(session.duration) • \(session.effort)")
                                .font(.footnote)
                                .foregroundStyle(Color.hoxaRosewood)
                        }
                    }

                    adjustmentOption(
                        title: "Move session to another day",
                        subtitle: "Keep the workout, just shift it to a better slot.",
                        symbol: "calendar.badge.clock",
                        action: { handleSelection(onMove) }
                    )

                    adjustmentOption(
                        title: "Reduce intensity",
                        subtitle: "Shorten the session or keep the same focus with less load.",
                        symbol: "minus.circle",
                        action: { handleSelection(onReduceIntensity) }
                    )

                    adjustmentOption(
                        title: "Swap for recovery or mobility",
                        subtitle: "Protect consistency with an easier session.",
                        symbol: "heart.text.square",
                        action: { handleSelection(onSwapToRecovery) }
                    )
                }
                .padding(20)
            }
            .background(Color.hoxaCanvas.ignoresSafeArea())
            .navigationTitle("Adjust week")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func handleSelection(_ action: () -> Void) {
        action()
        dismiss()
    }

    private func adjustmentOption(
        title: String,
        subtitle: String,
        symbol: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: symbol)
                    .font(.headline)
                    .foregroundStyle(Color.hoxaRosewood)
                    .frame(width: 24)

                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(Color.hoxaInk)
                    Text(subtitle)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer()
            }
            .padding(14)
            .background(Color.white.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(Color.hoxaRosewood.opacity(0.12), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

private extension TrainingSession {
    func movedForwardToNextDay() -> TrainingSession {
        TrainingSession(
            id: id,
            day: nextDay(after: day),
            title: title,
            sessionType: sessionType,
            duration: duration,
            effort: effort,
            location: location,
            reason: "Hoxa kept the same workout but moved it to fit the week more gently.",
            status: .moved,
            rescheduleHint: "The goal stays the same. The timing just moves to a more practical day."
        )
    }

    func withReducedIntensity() -> TrainingSession {
        TrainingSession(
            id: id,
            day: day,
            title: reducedIntensityTitle(),
            sessionType: sessionType,
            duration: reducedDuration(),
            effort: "Light",
            location: location,
            reason: "Hoxa kept the session in place and trimmed the load so it feels easier to start.",
            status: status,
            rescheduleHint: "A lighter version still supports consistency without pushing too hard."
        )
    }

    func withRecoverySwap() -> TrainingSession {
        TrainingSession(
            id: id,
            day: day,
            title: "Recovery reset",
            sessionType: .recovery,
            duration: "20 min",
            effort: "Gentle",
            location: "Home",
            reason: "Hoxa swapped the session for something that helps you bounce back well.",
            status: status,
            rescheduleHint: "Recovery and mobility keep the week moving without adding strain."
        )
    }

    private func reducedIntensityTitle() -> String {
        switch sessionType {
        case .running:
            return "Easy version: \(title)"
        case .strength:
            return "Light version: \(title)"
        case .mobility:
            return title
        case .balance:
            return "Shorter version: \(title)"
        case .recovery:
            return title
        }
    }

    private func reducedDuration() -> String {
        let trimmed = duration.lowercased()
            .replacingOccurrences(of: "min", with: "")
            .trimmingCharacters(in: .whitespaces)

        guard let value = Int(trimmed) else {
            return duration
        }

        return "\(max(10, value - 10)) min"
    }

    private func nextDay(after day: String) -> String {
        let orderedDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

        guard let currentIndex = orderedDays.firstIndex(of: day) else {
            return day
        }

        let nextIndex = (currentIndex + 1) % orderedDays.count
        return orderedDays[nextIndex]
    }
}

#if DEBUG
struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView(appModel: AppModel())
    }
}
#endif
