import SwiftUI

struct HoxaCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(.white.opacity(0.82))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .stroke(Color.white.opacity(0.72), lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.05), radius: 16, x: 0, y: 8)
    }
}

extension Color {
    static let hoxaCanvas = Color(red: 246 / 255, green: 244 / 255, blue: 232 / 255)
    static let hoxaBlush = Color(red: 220 / 255, green: 155 / 255, blue: 155 / 255)
    static let hoxaSage = Color(red: 229 / 255, green: 238 / 255, blue: 228 / 255)
    static let hoxaMint = Color(red: 192 / 255, green: 225 / 255, blue: 210 / 255)
    static let hoxaRosewood = Color(red: 127 / 255, green: 90 / 255, blue: 89 / 255)
    static let hoxaInk = Color(red: 47 / 255, green: 41 / 255, blue: 37 / 255)
}
