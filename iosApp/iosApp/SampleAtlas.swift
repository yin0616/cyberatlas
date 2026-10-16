import Foundation

enum SampleAtlas {
    static let worlds: [AtlasWorld] = [
        world("fundamentals", "資安基礎", "CIA、風險、身分、權限與日誌。", "盾牌", "CIA 三元素", "先判斷破壞的是哪個安全目標", .concept),
        world("networking", "網路世界", "IP、DNS、TCP、HTTP、NAT 與防火牆。", "網路", "DNS 解析", "網域不只是網站名稱", .practice),
        world("web", "Web 安全", "HTTP、Cookie、Session、SQLi、XSS 與 CSRF。", "瀏覽器", "SQL 注入", "輸入一旦改變查詢語意，就是危險訊號", .practice),
        world("os", "作業系統", "行程、執行緒、權限、系統呼叫與檔案系統。", "終端機", "Linux 權限", "rwx 要拆成 owner、group、others", .concept),
        world("architecture", "計算機架構", "二進位、暫存器、堆疊與記憶體。", "CPU", "大小端序", "同一個數值在記憶體裡可能反著放", .pitfall),
        world("crypto", "密碼學", "編碼、雜湊、加密、簽章、憑證與 TLS。", "鑰匙", "雜湊不是加密", "Hash 是單向摘要，不是拿來解密", .pitfall),
        world("forensics", "數位鑑識", "檔案、封包、日誌、記憶體與 metadata。", "放大鏡", "PCAP 初探", "先看 protocol hierarchy，再追可疑流量", .mission),
        world("reverse-pwn", "逆向與漏洞利用", "Binary、組語、debugger、stack overflow 與 ROP。", "漏洞", "strings 初探", "先建立 binary 的第一張地圖", .practice),
        world("governance", "治理與法遵", "ISO、資通安全法、個資與事件應變。", "文件", "ISO 27001 與 27002", "要求和指引要分清楚", .concept)
    ]

    private static func world(
        _ id: String,
        _ title: String,
        _ summary: String,
        _ icon: String,
        _ countryTitle: String,
        _ cardTitle: String,
        _ kind: CardKind
    ) -> AtlasWorld {
        AtlasWorld(
            id: id,
            title: title,
            summary: summary,
            icon: icon,
            countryTitle: countryTitle,
            card: ConceptCard(
                id: "\(id)-card",
                title: cardTitle,
                kind: kind,
                difficulty: 2,
                whatItIs: "這裡放概念的白話定義。",
                inPractice: "這裡放實戰使用方式或常見場景。",
                checkpoint: "完成這張卡的小任務，確認自己能用一句話解釋它。"
            )
        )
    }
}
