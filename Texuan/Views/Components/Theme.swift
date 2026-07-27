import SwiftUI

enum TexuanTheme {
    static let paper = Color(red: 0.965, green: 0.958, blue: 0.935)
    static let ink = Color(red: 0.075, green: 0.086, blue: 0.102)
    static let muted = Color(red: 0.400, green: 0.420, blue: 0.455)
    static let acid = Color(red: 0.655, green: 0.900, blue: 0.225)
    static let coral = Color(red: 1.000, green: 0.410, blue: 0.330)
    static let sky = Color(red: 0.250, green: 0.650, blue: 0.960)
    static let line = Color.black.opacity(0.12)

    static let pageGradient = LinearGradient(
        colors: [
            Color(red: 0.970, green: 0.965, blue: 0.940),
            Color(red: 0.935, green: 0.965, blue: 0.985)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

extension View {
    func texuanPage() -> some View {
        background(TexuanTheme.pageGradient.ignoresSafeArea())
    }
}
