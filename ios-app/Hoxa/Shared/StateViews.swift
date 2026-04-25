import SwiftUI

struct EmptyStateView: View {
    let title: String
    let message: String
    let systemImage: String
    var actionTitle: String?
    var action: (() -> Void)?

    init(
        title: String,
        message: String,
        systemImage: String,
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
        self.actionTitle = actionTitle
        self.action = action
    }

    var body: some View {
        stateCard {
            stateHeader(
                tint: .hoxaRosewood,
                systemImage: systemImage,
                background: Color.hoxaSage.opacity(0.9)
            )

            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(Color.hoxaInk)

                Text(message)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            if let actionTitle, let action {
                Button(actionTitle, action: action)
                    .buttonStyle(.borderedProminent)
                    .tint(Color.hoxaRosewood)
            }
        }
    }
}

struct LoadingStateView: View {
    let title: String
    let message: String
    let systemImage: String

    init(
        title: String = "Getting things ready",
        message: String = "This only takes a moment.",
        systemImage: String = "clock.arrow.2.circlepath"
    ) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
    }

    var body: some View {
        stateCard {
            stateHeader(
                tint: .hoxaRosewood,
                systemImage: systemImage,
                background: Color.hoxaBlush.opacity(0.22)
            )

            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(Color.hoxaInk)

                Text(message)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            SwiftUI.ProgressView()
                .tint(Color.hoxaRosewood)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct ErrorStateView: View {
    let title: String
    let message: String
    let systemImage: String
    var actionTitle: String?
    var action: (() -> Void)?

    init(
        title: String,
        message: String,
        systemImage: String = "exclamationmark.triangle",
        actionTitle: String? = "Try again",
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
        self.actionTitle = actionTitle
        self.action = action
    }

    var body: some View {
        stateCard {
            stateHeader(
                tint: .hoxaRosewood,
                systemImage: systemImage,
                background: Color.hoxaBlush.opacity(0.25)
            )

            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(Color.hoxaInk)

                Text(message)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            if let actionTitle, let action {
                Button(actionTitle, action: action)
                    .buttonStyle(.borderedProminent)
                    .tint(Color.hoxaRosewood)
            }
        }
    }
}

private struct StateCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        HoxaCard {
            VStack(alignment: .leading, spacing: 14) {
                content
            }
        }
    }
}

private func stateCard<Content: View>(@ViewBuilder content: () -> Content) -> some View {
    StateCard(content: content)
}

private func stateHeader(
    tint: Color,
    systemImage: String,
    background: Color
) -> some View {
    Image(systemName: systemImage)
        .font(.system(size: 18, weight: .semibold))
        .foregroundStyle(tint)
        .frame(width: 42, height: 42)
        .background(background)
        .clipShape(Circle())
}

#if DEBUG
struct StateViews_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 16) {
                EmptyStateView(
                    title: "Nothing here yet",
                    message: "This section will fill in once your training data is ready.",
                    systemImage: "sparkles"
                )

                LoadingStateView(
                    title: "Loading your week",
                    message: "We’re pulling everything together now."
                )

                ErrorStateView(
                    title: "We couldn’t load this section",
                    message: "Please try again in a moment."
                )
            }
            .padding(20)
        }
        .background(Color.hoxaCanvas.ignoresSafeArea())
    }
}
#endif
