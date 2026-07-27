import Foundation

final class CardStore: ObservableObject {
    @Published private(set) var cards: [StudyCard]
    @Published private(set) var savedIDs: Set<String>
    @Published private(set) var masteredIDs: Set<String>

    private let savedKey = "texuan.savedIDs"
    private let masteredKey = "texuan.masteredIDs"

    init(
        cards: [StudyCard] = SampleCards.cards,
        defaults: UserDefaults = .standard
    ) {
        self.cards = cards
        self.savedIDs = Set(defaults.stringArray(forKey: savedKey) ?? [])
        self.masteredIDs = Set(defaults.stringArray(forKey: masteredKey) ?? [])
    }

    var todaysExpedition: [StudyCard] {
        cards
            .sorted { priorityScore($0) > priorityScore($1) }
            .prefix(5)
            .map { $0 }
    }

    var weakCards: [StudyCard] {
        cards.filter { savedIDs.contains($0.id) || !masteredIDs.contains($0.id) }
    }

    var masteredCount: Int {
        cards.filter { masteredIDs.contains($0.id) }.count
    }

    var savedCount: Int {
        savedIDs.count
    }

    var worldCount: Int {
        Set(cards.map(\.world)).count
    }

    var countryCount: Int {
        Set(cards.map(\.country)).count
    }

    func isSaved(_ card: StudyCard) -> Bool {
        savedIDs.contains(card.id)
    }

    func isMastered(_ card: StudyCard) -> Bool {
        masteredIDs.contains(card.id)
    }

    func toggleSaved(_ card: StudyCard) {
        if savedIDs.contains(card.id) {
            savedIDs.remove(card.id)
        } else {
            savedIDs.insert(card.id)
        }
        persist(savedIDs, key: savedKey)
    }

    func markMastered(_ card: StudyCard) {
        masteredIDs.insert(card.id)
        savedIDs.remove(card.id)
        persist(masteredIDs, key: masteredKey)
        persist(savedIDs, key: savedKey)
    }

    func markNeedsReview(_ card: StudyCard) {
        savedIDs.insert(card.id)
        masteredIDs.remove(card.id)
        persist(savedIDs, key: savedKey)
        persist(masteredIDs, key: masteredKey)
    }

    func resetProgress() {
        savedIDs.removeAll()
        masteredIDs.removeAll()
        persist(savedIDs, key: savedKey)
        persist(masteredIDs, key: masteredKey)
    }

    private func priorityScore(_ card: StudyCard) -> Int {
        var score = card.difficulty * 3
        if savedIDs.contains(card.id) { score += 12 }
        if card.kind == .challenge { score += 7 }
        if card.kind == .pitfall { score += 5 }
        if masteredIDs.contains(card.id) { score -= 10 }
        return score
    }

    private func persist(_ ids: Set<String>, key: String) {
        UserDefaults.standard.set(Array(ids), forKey: key)
    }
}
