import SwiftUI

struct LibraryView: View {
    @EnvironmentObject private var store: CardStore
    @State private var selectedWorld: String?
    @State private var searchText = ""

    private var filteredCards: [StudyCard] {
        store.cards.filter { card in
            let matchesWorld = selectedWorld == nil || card.world == selectedWorld
            let matchesSearch = searchText.isEmpty
                || card.title.localizedCaseInsensitiveContains(searchText)
                || card.englishTitle.localizedCaseInsensitiveContains(searchText)
                || card.world.localizedCaseInsensitiveContains(searchText)
                || card.country.localizedCaseInsensitiveContains(searchText)
                || card.checkpoint.localizedCaseInsensitiveContains(searchText)
            return matchesWorld && matchesSearch
        }
    }

    private var worlds: [String] {
        Array(Set(store.cards.map(\.world))).sorted()
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                kindPicker
                    .padding(.horizontal, 18)
                    .padding(.vertical, 12)

                List(filteredCards) { card in
                    LibraryCardRow(
                        card: card,
                        isSaved: store.isSaved(card),
                        isMastered: store.isMastered(card),
                        onToggleSaved: { store.toggleSaved(card) },
                        onMastered: { store.markMastered(card) }
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            .texuanPage()
            .navigationTitle("世界地圖")
            .searchable(text: $searchText, prompt: "搜尋中英文概念")
        }
    }

    private var kindPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                FilterChip(
                    title: "全部",
                    symbol: "globe.asia.australia.fill",
                    isSelected: selectedWorld == nil,
                    action: { selectedWorld = nil }
                )

                ForEach(worlds, id: \.self) { world in
                    FilterChip(
                        title: world,
                        symbol: "map.fill",
                        isSelected: selectedWorld == world,
                        action: { selectedWorld = world }
                    )
                }
            }
        }
    }
}

private struct FilterChip: View {
    let title: String
    let symbol: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label(title, systemImage: symbol)
                .font(.caption.weight(.black))
                .foregroundStyle(isSelected ? .white : TexuanTheme.ink)
                .padding(.horizontal, 12)
                .padding(.vertical, 9)
                .background(isSelected ? TexuanTheme.ink : .white.opacity(0.76))
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(TexuanTheme.line, lineWidth: 1)
                )
        }
    }
}

private struct LibraryCardRow: View {
    let card: StudyCard
    let isSaved: Bool
    let isMastered: Bool
    let onToggleSaved: () -> Void
    let onMastered: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(card.world.uppercased())
                        .font(.caption.weight(.black))
                        .foregroundStyle(TexuanTheme.muted)

                    Text(card.title)
                        .font(.headline.weight(.black))
                        .foregroundStyle(TexuanTheme.ink)

                    Text(card.englishTitle)
                        .font(.subheadline.weight(.bold))
                        .foregroundStyle(TexuanTheme.muted)
                }

                Spacer()

                Image(systemName: isMastered ? "checkmark.seal.fill" : card.kind.symbol)
                    .foregroundStyle(isMastered ? TexuanTheme.sky : card.accent.color)
                    .font(.title3.weight(.bold))
            }

            Text(card.checkpoint)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(TexuanTheme.ink)

            HStack(spacing: 8) {
                Button(action: onToggleSaved) {
                    Label(isSaved ? "待複習中" : "待複習", systemImage: isSaved ? "bookmark.fill" : "bookmark")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(TexuanButtonStyle(background: .white, foreground: TexuanTheme.ink))

                Button(action: onMastered) {
                    Label("懂了", systemImage: "checkmark")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(TexuanButtonStyle(background: TexuanTheme.ink, foreground: .white))
            }
        }
        .padding(14)
        .background(.white.opacity(0.76))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(TexuanTheme.line, lineWidth: 1)
        )
    }
}
