package tw.yin.cyberatlas

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue
import tw.yin.cyberatlas.data.SampleAtlas

class SampleAtlasTest {
    @Test
    fun sampleAtlasHasSkeletonWorlds() {
        assertEquals(9, SampleAtlas.worlds.size)
        assertTrue(SampleAtlas.worlds.all { it.countries.isNotEmpty() })
        assertTrue(SampleAtlas.worlds.all { world ->
            world.countries.all { country -> country.cards.isNotEmpty() }
        })
    }
}
