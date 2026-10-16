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
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import tw.yin.cyberatlas.data.SampleAtlas
import tw.yin.cyberatlas.model.AtlasWorld
import tw.yin.cyberatlas.model.ConceptCard

@Composable
fun CyberAtlasApp() {
    MaterialTheme(colorScheme = lightColorScheme(background = Color(0xFFF4F7FB))) {
        var selectedWorld by remember { mutableStateOf<AtlasWorld?>(null) }
        Surface(modifier = Modifier.fillMaxSize()) {
            selectedWorld?.let { world ->
                WorldDetailScreen(world, onBack = { selectedWorld = null })
            } ?: WorldListScreen(SampleAtlas.worlds, onOpenWorld = { selectedWorld = it })
        }
    }
}

@Composable
private fun WorldListScreen(worlds: List<AtlasWorld>, onOpenWorld: (AtlasWorld) -> Unit) {
    LazyColumn(
        modifier = Modifier.padding(horizontal = 18.dp, vertical = 22.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        item {
            Text("CyberAtlas", fontSize = 34.sp, color = Color(0xFF111827))
            Spacer(Modifier.padding(4.dp))
            Text("資安地圖：用大世界和小國家整理資安學習。", color = Color(0xFF4B5563))
        }
        items(worlds) { world ->
            Card(
                modifier = Modifier.fillMaxWidth().clickable { onOpenWorld(world) },
                shape = RoundedCornerShape(10.dp),
                colors = CardDefaults.cardColors(containerColor = Color.White)
            ) {
                Row(modifier = Modifier.padding(16.dp), horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                    Text(world.icon, color = Color(0xFF075985))
                    Column {
                        Text(world.title, fontSize = 20.sp, color = Color(0xFF111827))
                        Text(world.summary, color = Color(0xFF4B5563))
                    }
                }
            }
        }
    }
}

@Composable
private fun WorldDetailScreen(world: AtlasWorld, onBack: () -> Unit) {
    LazyColumn(
        modifier = Modifier.padding(horizontal = 18.dp, vertical = 22.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        item { Button(onClick = onBack) { Text("返回地圖") } }
        item {
            Text(world.title, fontSize = 30.sp, color = Color(0xFF111827))
            Text(world.summary, color = Color(0xFF4B5563))
        }
        world.countries.forEach { country ->
            item {
                Card(colors = CardDefaults.cardColors(containerColor = Color.White)) {
                    Column(modifier = Modifier.padding(16.dp), verticalArrangement = Arrangement.spacedBy(10.dp)) {
                        Text(country.title, fontSize = 22.sp, color = Color(0xFF111827))
                        Text(country.summary, color = Color(0xFF4B5563))
                        country.cards.forEach { card -> ConceptCardBlock(card) }
                    }
                }
            }
        }
    }
}

@Composable
private fun ConceptCardBlock(card: ConceptCard) {
    Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
        Text("${card.kind.title} / 難度 ${card.difficulty}", color = Color(0xFF2563EB))
        Text(card.title, fontSize = 18.sp, color = Color(0xFF111827))
        Text("這是什麼：${card.whatItIs}", color = Color(0xFF374151))
        Text("實戰：${card.inPractice}", color = Color(0xFF374151))
        Text("小任務：${card.checkpoint}", color = Color(0xFF374151))
    }
}
