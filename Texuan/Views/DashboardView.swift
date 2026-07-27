import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var store: CardStore

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    header
                    metrics

                    Text("今日探索")
                        .font(.title3.weight(.black))
                        .foregroundStyle(TexuanTheme.ink)
                        .padding(.top, 4)

                    ForEach(store.todaysExpedition) { card in
                        StudyCardView(
                            card: card,
                            isSaved: store.isSaved(card),
                            isMastered: store.isMastered(card),
                            onToggleSaved: { store.toggleSaved(card) },
                            onMastered: { store.markMastered(card) },
                            onNeedsReview: { store.markNeedsReview(card) }
                        )
                    }
                }
                .padding(18)
            }
            .texuanPage()
            .navigationTitle("資安地圖")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        store.resetProgress()
                    } label: {
                        Image(systemName: "arrow.triangle.2.circlepath")
                    }
                    .accessibilityLabel("重置進度")
                }
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Text("Cyber Atlas")
                    .font(.caption.weight(.black))
                    .foregroundStyle(TexuanTheme.ink)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 7)
                    .background(TexuanTheme.acid)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                Text("免費雙語資安知識地圖")
                    .font(.caption.weight(.bold))
                    .foregroundStyle(TexuanTheme.muted)
            }

            Text("從基石一路走到攻防。")
                .font(.system(size: 34, weight: .black, design: .rounded))
                .foregroundStyle(TexuanTheme.ink)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, 6)
    }

    private var metrics: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
            MetricPill(title: "世界", value: "\(store.worldCount)", symbol: "globe.asia.australia.fill", accent: TexuanTheme.acid)
            MetricPill(title: "小國家", value: "\(store.countryCount)", symbol: "map.fill", accent: TexuanTheme.coral)
            MetricPill(title: "已懂", value: "\(store.masteredCount)", symbol: "checkmark.seal.fill", accent: TexuanTheme.sky)
            MetricPill(title: "待複習", value: "\(store.savedCount)", symbol: "bookmark.fill", accent: .white)
        }
    }
}
