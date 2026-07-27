package tw.yin.cyberatlas.ui

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import tw.yin.cyberatlas.data.SampleAtlas
import tw.yin.cyberatlas.model.AtlasWorld
import tw.yin.cyberatlas.model.ConceptCard

@Composable
fun CyberAtlasApp() {
    MaterialTheme(
        colorScheme = lightColorScheme(
            primary = Color(0xFF111827),
            secondary = Color(0xFF2563EB),
            surface = Color(0xFFFFFCF7),
            background = Color(0xFFF4F7FB)
        )
    ) {
        var selectedWorld by remember { mutableStateOf<AtlasWorld?>(null) }

        Surface(
            modifier = Modifier.fillMaxSize(),
            color = MaterialTheme.colorScheme.background
        ) {
            selectedWorld?.let { world ->
                WorldDetailScreen(
                    world = world,
                    onBack = { selectedWorld = null }
                )
            } ?: WorldMapScreen(
                worlds = SampleAtlas.worlds,
                onOpenWorld = { selectedWorld = it }
            )
        }
    }
}

@Composable
private fun WorldMapScreen(
    worlds: List<AtlasWorld>,
    onOpenWorld: (AtlasWorld) -> Unit
) {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 18.dp, vertical = 22.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        item {
            HeaderBlock()
        }

        items(worlds) { world ->
            WorldRow(
                world = world,
                onClick = { onOpenWorld(world) }
            )
        }
    }
}

@Composable
private fun HeaderBlock() {
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text(
            text = "CyberAtlas",
            fontSize = 34.sp,
            fontWeight = FontWeight.Black,
            color = Color(0xFF111827)
        )
        Text(
            text = "資安地圖：用大世界和小國家整理資安、網路、作業系統、底層架構與比賽實戰。",
            fontSize = 15.sp,
            color = Color(0xFF4B5563),
            lineHeight = 22.sp
        )
        Spacer(modifier = Modifier.height(6.dp))
    }
}

@Composable
private fun WorldRow(
    world: AtlasWorld,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(8.dp),
        colors = CardDefaults.cardColors(containerColor = Color.White),
        elevation = CardDefaults.cardElevation(defaultElevation = 1.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(14.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalAlignment = Alignment.Top
        ) {
            Box(
                modifier = Modifier
                    .background(Color(0xFFE0F2FE), RoundedCornerShape(8.dp))
                    .padding(horizontal = 10.dp, vertical = 8.dp)
            ) {
                Text(
                    text = world.icon,
                    fontSize = 13.sp,
                    fontWeight = FontWeight.Black,
                    color = Color(0xFF075985)
                )
            }

            Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                Text(
                    text = world.title,
                    fontSize = 19.sp,
                    fontWeight = FontWeight.Black,
                    color = Color(0xFF111827)
                )
                Text(
                    text = world.summary,
                    fontSize = 14.sp,
                    color = Color(0xFF4B5563),
                    lineHeight = 20.sp
                )
                Text(
                    text = "${world.countries.size} 個小國家",
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Bold,
                    color = Color(0xFF2563EB)
                )
            }
        }
    }
}

@Composable
private fun WorldDetailScreen(
    world: AtlasWorld,
    onBack: () -> Unit
) {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 18.dp, vertical = 22.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        item {
            Button(onClick = onBack) {
                Text("返回地圖")
            }
        }

        item {
            Text(
                text = world.title,
                fontSize = 30.sp,
                fontWeight = FontWeight.Black,
                color = Color(0xFF111827)
            )
            Text(
                text = world.summary,
                fontSize = 15.sp,
                color = Color(0xFF4B5563),
                lineHeight = 22.sp,
                modifier = Modifier.padding(top = 6.dp)
            )
        }

        world.countries.forEach { country ->
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(8.dp),
                    colors = CardDefaults.cardColors(containerColor = Color.White)
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(10.dp)
                    ) {
                        Text(
                            text = country.title,
                            fontSize = 22.sp,
                            fontWeight = FontWeight.Black,
                            color = Color(0xFF111827)
                        )
                        Text(
                            text = country.summary,
                            fontSize = 14.sp,
                            color = Color(0xFF4B5563)
                        )
                        HorizontalDivider(color = Color(0xFFE5E7EB))
                        country.cards.forEach { card ->
                            ConceptCardBlock(card)
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun ConceptCardBlock(card: ConceptCard) {
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text(
            text = "${card.kind.title} / 難度 ${card.difficulty}",
            fontSize = 12.sp,
            fontWeight = FontWeight.Black,
            color = Color(0xFF2563EB)
        )
        Text(
            text = card.title,
            fontSize = 18.sp,
            fontWeight = FontWeight.Black,
            color = Color(0xFF111827)
        )
        InfoLine(label = "這是什麼", text = card.whatItIs)
        InfoLine(label = "實戰", text = card.inPractice)
        InfoLine(label = "小任務", text = card.checkpoint)
    }
}

@Composable
private fun InfoLine(
    label: String,
    text: String
) {
    Column(verticalArrangement = Arrangement.spacedBy(3.dp)) {
        Text(
            text = label,
            fontSize = 12.sp,
            fontWeight = FontWeight.Black,
            color = Color(0xFF111827)
        )
        Text(
            text = text,
            fontSize = 14.sp,
            color = Color(0xFF374151),
            lineHeight = 20.sp
        )
    }
}
