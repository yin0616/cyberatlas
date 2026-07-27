import SwiftUI

struct WeakListView: View {
    @EnvironmentObject private var store: CardStore

    var body: some View {
        NavigationStack {
            List {
                Section {
                    if store.weakCards.isEmpty {
                        ContentUnavailableView("待複習清空", systemImage: "checkmark.seal.fill", description: Text("目前沒有被留下的概念"))
                            .listRowBackground(Color.clear)
                    } else {
                        ForEach(store.weakCards) { card in
                            WeakCardRow(card: card)
                                .swipeActions(edge: .trailing) {
                                    Button {
                                        store.markMastered(card)
                                    } label: {
                                        Label("懂了", systemImage: "checkmark")
                                    }
                                    .tint(.green)
                                }
                                .swipeActions(edge: .leading) {
                                    Button {
                                        store.toggleSaved(card)
                                    } label: {
                                        Label(store.isSaved(card) ? "取消" : "留下", systemImage: "bookmark")
                                    }
                                    .tint(.orange)
                                }
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .texuanPage()
            .navigationTitle("待複習")
        }
    }
}

private struct WeakCardRow: View {
    let card: StudyCard

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Label(card.kind.title, systemImage: card.kind.symbol)
                    .font(.caption.weight(.black))
                    .foregroundStyle(TexuanTheme.ink)

                Spacer()

                Text(card.world)
                    .font(.caption.weight(.bold))
                    .foregroundStyle(TexuanTheme.muted)
            }

            Text(card.title)
                .font(.headline.weight(.black))
                .foregroundStyle(TexuanTheme.ink)

            Text(card.checkpoint)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(TexuanTheme.muted)
        }
        .padding(.vertical, 8)
    }
}
