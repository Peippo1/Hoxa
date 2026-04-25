import SwiftUI

struct ProgressView: View {
    @ObservedObject var appModel: AppModel

    private var viewModel: ProgressViewModel {
        ProgressViewModel(appModel: appModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Recent progress")
                                .font(.caption)
                                .tracking(2)
                                .foregroundStyle(Color.hoxaRosewood)

                            Text(viewModel.summary.headline)
                                .font(.system(size: 30, weight: .semibold, design: .serif))
                                .foregroundStyle(Color.hoxaInk)

                            Text(viewModel.summary.detail)
                                .font(.footnote)
                                .foregroundStyle(.secondary)

                            Text(viewModel.summary.nextStep)
                                .font(.footnote)
                                .foregroundStyle(Color.hoxaRosewood)
                        }
                    }

                    if viewModel.metrics.isEmpty {
                        EmptyStateView(
                            title: "No progress summary yet",
                            message: "Your first trends will appear here once there is enough training history.",
                            systemImage: "chart.line.uptrend.xyaxis"
                        )
                    } else {
                        ForEach(viewModel.metrics) { metric in
                            HoxaCard {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(metric.label)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                    Text(metric.value)
                                        .font(.system(size: 42, weight: .semibold, design: .serif))
                                        .foregroundStyle(Color.hoxaInk)
                                    Text(metric.change)
                                        .font(.footnote)
                                        .foregroundStyle(Color.hoxaRosewood)
                                }
                            }
                        }
                    }

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Progress Notes")
                                .font(.headline)

                            if viewModel.notes.isEmpty {
                                EmptyStateView(
                                    title: "Notes will show up here soon",
                                    message: "We’ll add a few simple coaching notes once progress data is available.",
                                    systemImage: "note.text"
                                )
                            } else {
                                ForEach(viewModel.notes) { note in
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(note.title)
                                            .font(.subheadline.weight(.semibold))
                                        Text(note.detail)
                                            .font(.footnote)
                                            .foregroundStyle(.secondary)
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
            .navigationTitle("Progress")
        }
    }
}

#if DEBUG
struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(appModel: AppModel())
    }
}
#endif
