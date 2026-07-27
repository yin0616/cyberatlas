import SwiftUI

struct MetricPill: View {
    let title: String
    let value: String
    let symbol: String
    let accent: Color

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: symbol)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(TexuanTheme.ink)
                .frame(width: 30, height: 30)
                .background(accent)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

            VStack(alignment: .leading, spacing: 2) {
                Text(value)
                    .font(.headline.weight(.black))
                    .foregroundStyle(TexuanTheme.ink)

                Text(title)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(TexuanTheme.muted)
            }
            .lineLimit(1)
            .minimumScaleFactor(0.8)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.72))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(TexuanTheme.line, lineWidth: 1)
        )
    }
}
