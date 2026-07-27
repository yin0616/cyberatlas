import Foundation

enum SampleCards {
    static let cards: [StudyCard] = [
        card(
            id: "fundamentals-cia",
            title: "CIA 三元素",
            englishTitle: "CIA Triad",
            world: "Security Fundamentals / 資安基礎",
            country: "Core Principles / 核心原則",
            kind: .concept,
            difficulty: 1,
            whatItIs: "機密性、完整性、可用性，是分析資安事件的第一層地圖。",
            inPractice: "偷看是 C，竄改是 I，服務不可用是 A。",
            checkpoint: "先判斷事件破壞了 C、I、A 哪一個。",
            accent: .acid
        ),
        card(
            id: "networking-dns",
            title: "DNS 解析",
            englishTitle: "DNS Resolution",
            world: "Networking / 網路世界",
            country: "Naming / 命名",
            kind: .practice,
            difficulty: 2,
            whatItIs: "DNS 把 domain name 轉成 IP，也可能藏有 TXT、CNAME、MX 等線索。",
            inPractice: "CTF、偵查、釣魚分析、郵件安全都常需要查 DNS record。",
            checkpoint: "遇到陌生網域時，不只打開網站，也查 DNS record。",
            accent: .sky
        ),
        card(
            id: "web-sqli",
            title: "SQL 注入",
            englishTitle: "SQL Injection",
            world: "Web Security / Web 安全",
            country: "Injection / 注入",
            kind: .practice,
            difficulty: 3,
            whatItIs: "使用者輸入被拼進 SQL，讓查詢邏輯被攻擊者改寫。",
            inPractice: "先測單引號、錯誤訊息、布林差異，再判斷後續攻擊路線。",
            checkpoint: "只要輸入能改變查詢語意，就要想到 injection。",
            accent: .coral
        ),
        card(
            id: "os-permissions",
            title: "Linux 權限",
            englishTitle: "Linux Permissions",
            world: "Operating Systems / 作業系統",
            country: "Permissions / 權限",
            kind: .concept,
            difficulty: 2,
            whatItIs: "owner、group、others 搭配 r、w、x 控制檔案與目錄權限。",
            inPractice: "提權、檔案外洩、部署安全、Linux CTF 題都會用到。",
            checkpoint: "看到 rwxr-xr-x，先拆成三段讀。",
            accent: .acid
        ),
        card(
            id: "arch-endianness",
            title: "大小端序",
            englishTitle: "Endianness",
            world: "Computer Architecture / 計算機架構",
            country: "Memory / 記憶體",
            kind: .pitfall,
            difficulty: 3,
            whatItIs: "Endianness 決定多位元組數值在記憶體裡的排列順序。",
            inPractice: "pwn payload、封包解析、檔案格式、hex dump 都常被它卡住。",
            checkpoint: "看到 hex dump，先確認 big-endian 或 little-endian。",
            accent: .coral
        ),
        card(
            id: "crypto-hash",
            title: "雜湊不是加密",
            englishTitle: "Hashing Is Not Encryption",
            world: "Cryptography / 密碼學",
            country: "Primitives / 基本元件",
            kind: .pitfall,
            difficulty: 2,
            whatItIs: "Hash 是單向摘要；Encryption 才談 key、加密與解密。",
            inPractice: "密碼儲存通常用 password hashing 加 salt，不是可逆加密。",
            checkpoint: "先問：這個輸出設計上能不能還原？",
            accent: .sky
        ),
        card(
            id: "forensics-pcap",
            title: "PCAP 第一輪檢查",
            englishTitle: "PCAP First Pass",
            world: "Digital Forensics / 數位鑑識",
            country: "Network Forensics / 網路鑑識",
            kind: .challenge,
            difficulty: 3,
            whatItIs: "PCAP 是封包紀錄檔，可以用 Wireshark 或 tshark 還原網路互動。",
            inPractice: "比賽常把帳密、檔案、DNS 線索或惡意流量藏在封包裡。",
            checkpoint: "先看 protocol hierarchy，再追可疑 stream。",
            accent: .acid
        ),
        card(
            id: "reverse-strings",
            title: "strings 初探",
            englishTitle: "First Pass with strings",
            world: "Reverse & Pwn / 逆向與漏洞利用",
            country: "Recon / 初步偵查",
            kind: .practice,
            difficulty: 2,
            whatItIs: "strings 從 binary 抽出可讀字串，幫你快速找提示與錯誤訊息。",
            inPractice: "逆向前先跑 file、strings、checksec，通常比直接進 debugger 穩。",
            checkpoint: "找 usage、password、flag、/bin/sh、URL 這類高訊號字串。",
            accent: .ink
        ),
        card(
            id: "governance-iso",
            title: "ISO 27001 與 27002",
            englishTitle: "ISO 27001 vs ISO 27002",
            world: "Governance & Compliance / 治理與法遵",
            country: "ISMS / 資安管理制度",
            kind: .concept,
            difficulty: 3,
            whatItIs: "27001 偏管理制度要求，27002 偏控制措施指引。",
            inPractice: "要看制度與稽核要求找 27001；要看控制建議找 27002。",
            checkpoint: "先分清楚 requirement 和 guidance。",
            accent: .coral
        )
    ]

    private static func card(
        id: String,
        title: String,
        englishTitle: String,
        world: String,
        country: String,
        kind: CardKind,
        difficulty: Int,
        whatItIs: String,
        inPractice: String,
        checkpoint: String,
        accent: CardAccent
    ) -> StudyCard {
        StudyCard(
            id: id,
            title: title,
            englishTitle: englishTitle,
            world: world,
            country: country,
            kind: kind,
            difficulty: difficulty,
            whatItIs: whatItIs,
            whyItMatters: "這張卡是骨架範例，之後可以補上完整觀念、圖解、任務與延伸連結。",
            inPractice: inPractice,
            checkpoint: checkpoint,
            detail: "下一步內容擴充時，這裡可以放更完整的繁中解釋、英文摘要、比賽用法、常見誤解與迷你練習。",
            accent: accent
        )
    }
}
