import SwiftUI

struct WorldDetailView: View {
    let world: AtlasWorld

    var body: some View {
        List {
            Section(world.countryTitle) {
                Label(world.summary, systemImage: world.icon == "盾牌" ? "shield" : "book.closed")
                Text(world.card.title)
                    .font(.headline)
                LabeledContent("類型", value: world.card.kind.rawValue)
                LabeledContent("難度", value: "\(world.card.difficulty)")
                LabeledContent("這是什麼", value: world.card.whatItIs)
                LabeledContent("實戰", value: world.card.inPractice)
                LabeledContent("小任務", value: world.card.checkpoint)
            }
        }
        .navigationTitle(world.title)
    }
}
