package tw.yin.cyberatlas.model

enum class CardKind(
    val title: String
) {
    Concept("觀念"),
    Practice("實戰"),
    Pitfall("陷阱"),
    Mission("任務")
}

data class AtlasWorld(
    val id: String,
    val title: String,
    val summary: String,
    val icon: String,
    val countries: List<ConceptCountry>
)

data class ConceptCountry(
    val id: String,
    val title: String,
    val summary: String,
    val cards: List<ConceptCard>
)

data class ConceptCard(
    val id: String,
    val title: String,
    val kind: CardKind,
    val difficulty: Int,
    val whatItIs: String,
    val whyItMatters: String,
    val inPractice: String,
    val checkpoint: String,
    val detail: String
)
