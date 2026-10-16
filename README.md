# CyberAtlas / 資安地圖

CyberAtlas（資安地圖）是一個免費、中文優先的資安學習 App。

它不是單純刷題 app，而是用「大世界 / 小國家 / 概念卡 / 小任務」整理資安、網路、作業系統、計算機架構、密碼學、鑑識、逆向與治理法遵。

## 目前方向

- 英文品牌名：CyberAtlas
- 中文產品名：資安地圖
- Android：Kotlin + Jetpack Compose
- iOS：Swift + SwiftUI
- 第一版語言：中文版
- 內容策略：先做骨架與少量範例，不一次塞滿教材
- 資料策略：本機 sample data，之後再考慮匯入內容包或後端
- 商業策略：免費，不做訂閱、不塞廣告

## 專案結構

```text
.
├── androidApp/    # Kotlin + Jetpack Compose Android App
├── iosApp/        # Swift + SwiftUI iOS App
├── shared/        # 舊 KMP 模組，暫保留，未加入主建置
├── sharedUI/      # 舊 Compose Multiplatform 模組，暫保留，未加入主建置
├── gradle/        # Gradle version catalog
├── CONTENT_MAP.md
├── PRODUCT_SPEC.md
└── KMP_DEVELOPMENT.md
```

## 目前畫面骨架

- 地圖首頁：列出 9 個資安大世界
- 世界詳情：顯示該世界的小國家與代表概念卡
- 概念卡：顯示「這是什麼 / 實戰 / 小任務」

## 開發方式

建議用 Android Studio 或 IntelliJ IDEA 開啟此資料夾，Sync Gradle 後先跑 Android app。

```sh
./gradlew :androidApp:assembleDebug
```

目前沒有提交 Gradle wrapper。如果本機沒有 `./gradlew`，可以先用 IDE 產生 wrapper，或用已安裝的 `gradle` 執行：

```sh
gradle :androidApp:assembleDebug
```

## 兩台電腦與 Codex 同步

請參考 `CODEX_SYNC_GUIDE.md`。這份文件說明如何用 GitHub、`AGENTS.md`、ChatGPT Desktop / Codex Remote 或 Handoff，在家裡桌機和外出電腦之間接力開發。

## 開發狀態

目前 Android 已改為獨立 Kotlin/Compose 實作，iOS 已改為獨立 SwiftUI 實作。
`shared/` 與 `sharedUI/` 是重構前的 KMP 程式碼，待 Android/iOS 功能確認後再清理。
