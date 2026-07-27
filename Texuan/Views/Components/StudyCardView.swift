import SwiftUI

struct StudyCardView: View {
    let card: StudyCard
    let isSaved: Bool
    let isMastered: Bool
    let onToggleSaved: () -> Void
    let onMastered: () -> Void
    let onNeedsReview: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(alignment: .top) {
                HStack(spacing: 8) {
                    Image(systemName: card.kind.symbol)
                    Text(card.kind.title)
                }
                .font(.caption.weight(.black))
                .foregroundStyle(TexuanTheme.ink)
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .background(card.accent.color)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                Spacer()

                Button(action: onToggleSaved) {
                    Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(TexuanTheme.ink)
                        .frame(width: 38, height: 38)
                        .background(.white.opacity(0.82))
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
                .accessibilityLabel(isSaved ? "取消待複習" : "加入待複習")
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(card.world.uppercased())
                    .font(.caption.weight(.black))
                    .foregroundStyle(TexuanTheme.muted)

                Text(card.title)
                    .font(.system(size: 27, weight: .black, design: .rounded))
                    .foregroundStyle(TexuanTheme.ink)
                    .fixedSize(horizontal: false, vertical: true)

                Text(card.englishTitle)
                    .font(.callout.weight(.bold))
                    .foregroundStyle(TexuanTheme.muted)
                    .fixedSize(horizontal: false, vertical: true)
            }

            VStack(spacing: 12) {
                CardFactRow(title: "WHAT", text: card.whatItIs)
                CardFactRow(title: "USE", text: card.inPractice)
                CardFactRow(title: "CHECK", text: card.checkpoint)
            }

            HStack(spacing: 10) {
                Button(action: onNeedsReview) {
                    Label("再探索", systemImage: "arrow.counterclockwise")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(TexuanButtonStyle(background: .white, foreground: TexuanTheme.ink))

                Button(action: onMastered) {
                    Label(isMastered ? "已懂" : "懂了", systemImage: isMastered ? "checkmark.seal.fill" : "checkmark")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(TexuanButtonStyle(background: TexuanTheme.ink, foreground: .white))
            }
        }
        .padding(18)
        .background(.white.opacity(0.78))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(TexuanTheme.line, lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.06), radius: 20, x: 0, y: 12)
    }
}

private struct CardFactRow: View {
    let title: String
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(title)
                .font(.caption.weight(.black))
                .foregroundStyle(.white)
                .frame(width: 46, height: 26)
                .background(TexuanTheme.ink)
                .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))

            Text(text)
                .font(.callout.weight(.semibold))
                .foregroundStyle(TexuanTheme.ink)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TexuanButtonStyle: ButtonStyle {
    let background: Color
    let foreground: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline.weight(.black))
            .foregroundStyle(foreground)
            .padding(.vertical, 12)
            .background(background.opacity(configuration.isPressed ? 0.72 : 1))
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(TexuanTheme.line, lineWidth: background == .white ? 1 : 0)
            )
    }
}
