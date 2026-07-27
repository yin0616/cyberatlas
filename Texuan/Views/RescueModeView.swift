import SwiftUI

struct RescueModeView: View {
    @EnvironmentObject private var store: CardStore
    @State private var index = 0
    @State private var showsDetail = false

    private var rescueCards: [StudyCard] {
        store.cards
            .filter { $0.kind == .challenge || $0.kind == .pitfall || $0.difficulty >= 4 || store.isSaved($0) }
            .sorted { $0.difficulty > $1.difficulty }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 18) {
                progress

                if let card = rescueCards[safe: index] {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Label(card.kind.title, systemImage: card.kind.symbol)
                                .font(.caption.weight(.black))
                                .foregroundStyle(TexuanTheme.ink)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 7)
                                .background(card.accent.color)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                            Spacer()

                            Text("\(index + 1)/\(rescueCards.count)")
                                .font(.caption.weight(.black))
                                .foregroundStyle(TexuanTheme.muted)
                        }

                        Text(card.title)
                            .font(.system(size: 30, weight: .black, design: .rounded))
                            .foregroundStyle(TexuanTheme.ink)
                            .fixedSize(horizontal: false, vertical: true)

                        Text(card.englishTitle)
                            .font(.title3.weight(.black))
                            .foregroundStyle(TexuanTheme.muted)
                            .fixedSize(horizontal: false, vertical: true)

                        Text(card.checkpoint)
                            .font(.title3.weight(.black))
                            .foregroundStyle(TexuanTheme.ink)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(TexuanTheme.acid.opacity(0.9))
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                        if showsDetail {
                            Text(card.detail)
                                .font(.body.weight(.semibold))
                                .foregroundStyle(TexuanTheme.ink)
                                .fixedSize(horizontal: false, vertical: true)
                                .transition(.opacity.combined(with: .move(edge: .top)))
                        }

                        Spacer(minLength: 0)

                        Button {
                            withAnimation(.snappy) {
                                showsDetail.toggle()
                            }
                        } label: {
                            Label(showsDetail ? "收起" : "看任務解法", systemImage: showsDetail ? "chevron.up" : "arrow.trianglehead.2.clockwise")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(TexuanButtonStyle(background: .white, foreground: TexuanTheme.ink))

                        HStack(spacing: 10) {
                            Button {
                                store.markNeedsReview(card)
                                advance()
                            } label: {
                                Label("留作複習", systemImage: "bookmark.fill")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(TexuanButtonStyle(background: TexuanTheme.coral, foreground: .white))

                            Button {
                                store.markMastered(card)
                                advance()
                            } label: {
                                Label("過", systemImage: "checkmark")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(TexuanButtonStyle(background: TexuanTheme.ink, foreground: .white))
                        }
                    }
                    .padding(18)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .background(.white.opacity(0.78))
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(TexuanTheme.line, lineWidth: 1)
                    )
                } else {
                    ContentUnavailableView("沒有任務卡", systemImage: "checkmark.seal", description: Text("目前探索進度很乾淨"))
                }
            }
            .padding(18)
            .texuanPage()
            .navigationTitle("任務模式")
        }
    }

    private var progress: some View {
        HStack(spacing: 6) {
            ForEach(rescueCards.indices, id: \.self) { step in
                Capsule()
                    .fill(step <= index ? TexuanTheme.ink : TexuanTheme.line)
                    .frame(height: 7)
            }
        }
        .animation(.snappy, value: index)
    }

    private func advance() {
        withAnimation(.snappy) {
            showsDetail = false
            if index < max(rescueCards.count - 1, 0) {
                index += 1
            } else {
                index = 0
            }
        }
    }
}

private extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
