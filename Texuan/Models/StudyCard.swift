import SwiftUI

enum CardKind: String, CaseIterable, Codable, Identifiable {
    case concept
    case practice
    case pitfall
    case challenge

    var id: String { rawValue }

    var title: String {
        switch self {
        case .concept:
            "觀念"
        case .practice:
            "實戰"
        case .pitfall:
            "陷阱"
        case .challenge:
            "任務"
        }
    }

    var symbol: String {
        switch self {
        case .concept:
            "book.closed.fill"
        case .practice:
            "terminal.fill"
        case .pitfall:
            "exclamationmark.triangle.fill"
        case .challenge:
            "flag.checkered"
        }
    }
}

enum CardAccent: String, Codable {
    case acid
    case coral
    case sky
    case ink

    var color: Color {
        switch self {
        case .acid:
            TexuanTheme.acid
        case .coral:
            TexuanTheme.coral
        case .sky:
            TexuanTheme.sky
        case .ink:
            TexuanTheme.ink
        }
    }
}

struct StudyCard: Identifiable, Codable, Hashable {
    let id: String
    let title: String
    let englishTitle: String
    let world: String
    let country: String
    let kind: CardKind
    let difficulty: Int
    let whatItIs: String
    let whyItMatters: String
    let inPractice: String
    let checkpoint: String
    let detail: String
    let accent: CardAccent
}
