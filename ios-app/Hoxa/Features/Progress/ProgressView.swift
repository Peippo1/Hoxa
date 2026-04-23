import SwiftUI

struct ProgressView: View {
    @Bindable var appModel: AppModel

    private var viewModel: ProgressViewModel {
        ProgressViewModel(appModel: appModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
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

                    HoxaCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Progress Notes")
                                .font(.headline)

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
                .padding(20)
            }
            .background(Color.hoxaCanvas.ignoresSafeArea())
            .navigationTitle("Progress")
        }
    }
}

#Preview {
    ProgressView(appModel: AppModel())
}
