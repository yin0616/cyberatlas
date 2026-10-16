import Foundation

enum CardKind: String {
    case concept = "觀念"
    case practice = "實戰"
    case pitfall = "陷阱"
    case mission = "任務"
}

struct ConceptCard: Identifiable {
    let id: String
    let title: String
    let kind: CardKind
    let difficulty: Int
    let whatItIs: String
    let inPractice: String
    let checkpoint: String
}

struct AtlasWorld: Identifiable {
    let id: String
    let title: String
    let summary: String
    let icon: String
    let countryTitle: String
    let card: ConceptCard
}
