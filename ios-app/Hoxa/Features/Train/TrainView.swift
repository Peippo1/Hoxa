import SwiftUI

struct TrainView: View {
    @Bindable var appModel: AppModel

    private var viewModel: TrainViewModel {
        TrainViewModel(appModel: appModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Today")
                                .font(.caption)
                                .tracking(2)
                                .foregroundStyle(Color.hoxaRosewood)

                            Text(viewModel.todaySession.title)
                                .font(.system(size: 32, weight: .semibold, design: .serif))
                                .foregroundStyle(Color.hoxaInk)

                            Text("\(viewModel.todaySession.duration) • \(viewModel.todaySession.effort) • \(viewModel.todaySession.sessionType.rawValue)")
                                .font(.footnote)
                                .foregroundStyle(.secondary)

                            Text(viewModel.todaySession.reason)
                                .font(.footnote)
                                .foregroundStyle(.secondary)

                            HStack {
                                phaseCard("Warm up", detail: "5 minutes easy + dynamic mobility")
                                phaseCard("Main set", detail: "Primary effort block with beginner-friendly cues")
                                phaseCard("Cool down", detail: "Walk, breathe down, and note any tightness")
                            }
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Workout Library")
                                .font(.headline)

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
                .padding(20)
            }
            .background(Color.hoxaCanvas.ignoresSafeArea())
            .navigationTitle("Train")
        }
    }

    private func phaseCard(_ title: String, detail: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundStyle(Color.hoxaRosewood)
            Text(detail)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(Color.hoxaSage.opacity(0.75))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    TrainView(appModel: AppModel())
}
