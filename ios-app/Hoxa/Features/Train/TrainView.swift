import SwiftUI

struct TrainView: View {
    @ObservedObject var appModel: AppModel
    @State private var isLoggingWorkout = false
    @State private var completionLog: WorkoutCompletionLog?

    private var viewModel: TrainViewModel {
        TrainViewModel(appModel: appModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    if appModel.weeklyPlan.isEmpty {
                        EmptyStateView(
                            title: "Today’s training is not ready yet",
                            message: "As soon as a session is available, it will show up here with warm-up guidance.",
                            systemImage: "figure.run"
                        )
                    } else {
                        TrainSessionCard(
                            userName: viewModel.currentUser.displayName,
                            session: viewModel.todaySession,
                            completionLog: completionLog,
                            onLogWorkout: { isLoggingWorkout = true }
                        )

                        if let completionLog {
                            WorkoutCompletionSummaryCard(
                                sessionTitle: viewModel.todaySession.title,
                                log: completionLog
                            )
                        }

                        HoxaCard {
                            VStack(alignment: .leading, spacing: 12) {
                                Text(viewModel.workoutDetail.title)
                                    .font(.headline)

                                Text(viewModel.workoutDetail.objective)
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)

                                VStack(alignment: .leading, spacing: 10) {
                                    ForEach(Array(viewModel.workoutDetail.cues.enumerated()), id: \.offset) { _, cue in
                                        HStack(alignment: .top, spacing: 10) {
                                            Circle()
                                                .fill(Color.hoxaRosewood)
                                                .frame(width: 6, height: 6)
                                                .padding(.top, 6)
                                            Text(cue)
                                                .font(.footnote)
                                                .foregroundStyle(Color.hoxaInk)
                                        }
                                    }
                                }

                                Text(viewModel.workoutDetail.fallback)
                                    .font(.caption)
                                    .foregroundStyle(Color.hoxaRosewood)
                            }
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Workout Library")
                                .font(.headline)

                            if viewModel.workoutLibrary.isEmpty {
                                EmptyStateView(
                                    title: "No workouts in the library yet",
                                    message: "Once the catalog is available, you’ll see session ideas and quick details here.",
                                    systemImage: "dumbbell"
                                )
                            } else {
                                ForEach(viewModel.workoutLibrary) { item in
                                    VStack(alignment: .leading, spacing: 6) {
                                        HStack {
                                            Text(item.title)
                                                .font(.subheadline.weight(.semibold))
                                            Spacer()
                                            Text(item.duration)
                                                .font(.caption)
                                                .foregroundStyle(Color.hoxaRosewood)
                                        }
                                        Text("\(item.category) • \(item.equipment) • \(item.level)")
                                            .font(.footnote)
                                            .foregroundStyle(.secondary)
                                        Text(item.focus)
                                            .font(.caption)
                                            .foregroundStyle(Color.hoxaInk.opacity(0.65))
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                        }
                    }
                }
                .padding(20)
            }
            .background(Color.hoxaCanvas.ignoresSafeArea())
            .navigationTitle("Train")
            .sheet(isPresented: $isLoggingWorkout) {
                TrainWorkoutLogSheet(
                    session: viewModel.todaySession,
                    existingLog: completionLog,
                    onSave: { completionLog = $0 }
                )
            }
        }
    }
}

private struct TrainSessionCard: View {
    let userName: String
    let session: TrainingSession
    let completionLog: WorkoutCompletionLog?
    let onLogWorkout: () -> Void

    var body: some View {
        HoxaCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(userName)'s session")
                            .font(.caption)
                            .tracking(2)
                            .foregroundStyle(Color.hoxaRosewood)

                        Text(session.title)
                            .font(.system(size: 32, weight: .semibold, design: .serif))
                            .foregroundStyle(Color.hoxaInk)
                    }

                    Spacer()

                    Text(completionLog == nil ? session.status.rawValue : "Completed")
                        .font(.caption.weight(.medium))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(statusColor)
                        .clipShape(Capsule())
                }

                Text("\(session.duration) • \(session.effort) • \(session.sessionType.rawValue)")
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                Text(completionLog == nil ? session.reason : "Logged workout. Hoxa can now use this to keep the week balanced.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                if let completionLog {
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Workout logged", systemImage: "checkmark.circle.fill")
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(Color.hoxaInk)

                        Text("Completed \(completionLog.durationCompleted) min at a \(completionLog.perceivedEffort.rawValue.lowercased()) effort.")
                            .font(.footnote)
                            .foregroundStyle(Color.hoxaRosewood)
                    }
                    .padding(12)
                    .background(Color.hoxaMint.opacity(0.35))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }

                Button(action: onLogWorkout) {
                    Label(completionLog == nil ? "Log completed workout" : "Update workout log", systemImage: "checklist")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.hoxaInk)
            }
        }
    }

    private var statusColor: Color {
        if completionLog == nil {
            switch session.status {
            case .done:
                return .hoxaMint.opacity(0.9)
            case .today:
                return .hoxaBlush.opacity(0.25)
            case .upcoming:
                return .hoxaSage.opacity(0.9)
            case .moved:
                return .hoxaInk.opacity(0.9)
            }
        } else {
            return .hoxaMint.opacity(0.95)
        }
    }
}

private struct WorkoutCompletionSummaryCard: View {
    let sessionTitle: String
    let log: WorkoutCompletionLog

    var body: some View {
        HoxaCard {
            VStack(alignment: .leading, spacing: 12) {
                Label("Completed session", systemImage: "checkmark.seal.fill")
                    .font(.headline)
                    .foregroundStyle(Color.hoxaInk)

                Text(sessionTitle)
                    .font(.subheadline.weight(.semibold))

                HStack(spacing: 10) {
                    summaryChip(title: "Duration", value: "\(log.durationCompleted) min")
                    summaryChip(title: "Effort", value: log.perceivedEffort.rawValue)
                }

                if !log.notes.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Notes")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text(log.notes)
                            .font(.footnote)
                            .foregroundStyle(Color.hoxaInk)
                    }
                } else {
                    Text("No notes added. That is enough for the demo journey.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private func summaryChip(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.footnote.weight(.semibold))
                .foregroundStyle(Color.hoxaInk)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(Color.white.opacity(0.72))
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}

private struct TrainWorkoutLogSheet: View {
    let session: TrainingSession
    let existingLog: WorkoutCompletionLog?
    let onSave: (WorkoutCompletionLog) -> Void
    @Environment(\.dismiss) private var dismiss
    @State private var perceivedEffort: WorkoutEffort
    @State private var durationCompleted: Int
    @State private var notes: String

    init(
        session: TrainingSession,
        existingLog: WorkoutCompletionLog?,
        onSave: @escaping (WorkoutCompletionLog) -> Void
    ) {
        self.session = session
        self.existingLog = existingLog
        self.onSave = onSave
        _perceivedEffort = State(initialValue: existingLog?.perceivedEffort ?? .steady)
        _durationCompleted = State(initialValue: existingLog?.durationCompleted ?? session.plannedDurationMinutes)
        _notes = State(initialValue: existingLog?.notes ?? "")
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Log your workout")
                            .font(.system(size: 28, weight: .semibold, design: .serif))
                            .foregroundStyle(Color.hoxaInk)

                        Text("Avery’s demo stays calm and simple: capture what happened, then let Hoxa keep the week balanced.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(session.title)
                                .font(.headline)
                            Text("\(session.duration) planned • \(session.sessionType.rawValue)")
                                .font(.footnote)
                                .foregroundStyle(Color.hoxaRosewood)
                            Text(session.reason)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Perceived effort")
                                .font(.headline)

                            Picker("Perceived effort", selection: $perceivedEffort) {
                                ForEach(WorkoutEffort.allCases) { effort in
                                    Text(effort.rawValue).tag(effort)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("Duration completed")
                                    .font(.headline)
                                Spacer()
                                Text("\(durationCompleted) min")
                                    .font(.subheadline.weight(.semibold))
                                    .foregroundStyle(Color.hoxaRosewood)
                            }

                            Stepper(
                                "Minutes",
                                value: $durationCompleted,
                                in: 5...180,
                                step: 5
                            )
                            .labelsHidden()
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Notes")
                                .font(.headline)

                            TextEditor(text: $notes)
                                .frame(minHeight: 120)
                                .padding(10)
                                .background(Color.white.opacity(0.75))
                                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .stroke(Color.hoxaRosewood.opacity(0.12), lineWidth: 1)
                                )
                        }
                    }
                }
                .padding(20)
            }
            .background(Color.hoxaCanvas.ignoresSafeArea())
            .navigationTitle("Workout log")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        save()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }

    private func save() {
        let log = WorkoutCompletionLog(
            perceivedEffort: perceivedEffort,
            durationCompleted: durationCompleted,
            notes: notes
        )
        onSave(log)
        dismiss()
    }
}

private enum WorkoutEffort: String, CaseIterable, Identifiable {
    case gentle = "Gentle"
    case steady = "Steady"
    case challenging = "Challenging"

    var id: String { rawValue }
}

private struct WorkoutCompletionLog: Equatable {
    let perceivedEffort: WorkoutEffort
    let durationCompleted: Int
    let notes: String
}

private extension TrainingSession {
    var plannedDurationMinutes: Int {
        let trimmed = duration.lowercased()
            .replacingOccurrences(of: "min", with: "")
            .trimmingCharacters(in: .whitespaces)
        return Int(trimmed) ?? 20
    }
}

#if DEBUG
struct TrainView_Previews: PreviewProvider {
    static var previews: some View {
        TrainView(appModel: AppModel())
    }
}
#endif
