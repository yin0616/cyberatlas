package tw.yin.cyberatlas.data

import tw.yin.cyberatlas.model.AtlasWorld
import tw.yin.cyberatlas.model.CardKind
import tw.yin.cyberatlas.model.ConceptCard
import tw.yin.cyberatlas.model.ConceptCountry

object SampleAtlas {
    val worlds: List<AtlasWorld> = listOf(
        world(
            id = "fundamentals",
            title = "資安基礎",
            summary = "CIA、風險、身分、權限、日誌，先把安全判斷的底盤打好。",
            icon = "shield",
            countryTitle = "CIA 三元素",
            cardTitle = "先判斷破壞的是哪個安全目標",
            kind = CardKind.Concept,
            checkpoint = "看到案例時，先問：資料被偷看、被改掉，還是服務不能用？"
        ),
        world(
            id = "networking",
            title = "網路世界",
            summary = "IP、DNS、TCP、HTTP、NAT、防火牆，資安攻防的基石。",
            icon = "globe",
            countryTitle = "DNS 解析",
            cardTitle = "網域不只是網站名稱",
            kind = CardKind.Practice,
            checkpoint = "遇到陌生網域時，除了開網站，也要查 A、CNAME、TXT 紀錄。"
        ),
        world(
            id = "web",
            title = "Web 安全",
            summary = "HTTP、Cookie、Session、SQLi、XSS、CSRF、SSRF，從網站攻防開始。",
            icon = "browser",
            countryTitle = "SQL 注入",
            cardTitle = "輸入一旦改變查詢語意，就是危險訊號",
            kind = CardKind.Practice,
            checkpoint = "先測單引號、錯誤訊息、布林差異，再決定後續路線。"
        ),
        world(
            id = "os",
            title = "作業系統",
            summary = "行程、執行緒、權限、系統呼叫、檔案系統，理解程式如何被 OS 管理。",
            icon = "terminal",
            countryTitle = "Linux 權限",
            cardTitle = "rwx 要拆成 owner、group、others 讀",
            kind = CardKind.Concept,
            checkpoint = "看到 rwxr-xr-x，先切成三段，再判斷誰能讀、寫、執行。"
        ),
        world(
            id = "architecture",
            title = "計算機架構",
            summary = "二進位、十六進位、暫存器、堆疊、記憶體，逆向與 pwn 的地基。",
            icon = "cpu",
            countryTitle = "大小端序",
            cardTitle = "同一個數值，在記憶體裡可能反著放",
            kind = CardKind.Pitfall,
            checkpoint = "看到 hex dump 時，先確認 big-endian 還是 little-endian。"
        ),
        world(
            id = "crypto",
            title = "密碼學",
            summary = "編碼、雜湊、加密、簽章、憑證、TLS，把常混的概念拆開。",
            icon = "key",
            countryTitle = "雜湊不是加密",
            cardTitle = "Hash 是單向摘要，不是拿來解密",
            kind = CardKind.Pitfall,
            checkpoint = "先問：這個輸出設計上能不能還原？不能就不要叫解密。"
        ),
        world(
            id = "forensics",
            title = "數位鑑識",
            summary = "檔案、封包、日誌、記憶體、metadata，從痕跡裡還原事件。",
            icon = "magnifier",
            countryTitle = "PCAP 初探",
            cardTitle = "不要一開始就硬翻封包列表",
            kind = CardKind.Mission,
            checkpoint = "先看 protocol hierarchy，再追可疑 conversation 和 stream。"
        ),
        world(
            id = "reverse-pwn",
            title = "逆向與漏洞利用",
            summary = "binary 初探、組語、debugger、stack overflow、ROP，往比賽實戰前進。",
            icon = "bug",
            countryTitle = "strings 初探",
            cardTitle = "進 debugger 前，先建立 binary 的第一張地圖",
            kind = CardKind.Practice,
            checkpoint = "先跑 file、strings、checksec，找 usage、flag、URL、/bin/sh。"
        ),
        world(
            id = "governance",
            title = "治理與法遵",
            summary = "ISO 27001、27002、資通安全法、個資、事件應變，補上制度面。",
            icon = "document",
            countryTitle = "ISO 27001 與 27002",
            cardTitle = "要求和指引要分清楚",
            kind = CardKind.Concept,
            checkpoint = "問制度要求偏 27001；問控制措施指引偏 27002。"
        )
    )

    private fun world(
        id: String,
        title: String,
        summary: String,
        icon: String,
        countryTitle: String,
        cardTitle: String,
        kind: CardKind,
        checkpoint: String
    ): AtlasWorld = AtlasWorld(
        id = id,
        title = title,
        summary = summary,
        icon = icon,
        countries = listOf(
            ConceptCountry(
                id = "$id-main",
                title = countryTitle,
                summary = "第一版骨架範例，之後可擴充更多觀念卡、圖解與任務。",
                cards = listOf(
                    ConceptCard(
                        id = "$id-card",
                        title = cardTitle,
                        kind = kind,
                        difficulty = 2,
                        whatItIs = "這裡放概念的白話定義。",
                        whyItMatters = "這裡說明它為什麼對考試、比賽或實務有用。",
                        inPractice = "這裡放實戰使用方式或常見場景。",
                        checkpoint = checkpoint,
                        detail = "這裡之後可以補完整中文版教學、常見誤解、相關概念與延伸任務。"
                    )
                )
            )
        )
    )
}
