# CyberAtlas / 資安地圖

CyberAtlas（資安地圖）是一個免費、中文優先的 KMP 學習 app 骨架。

它不是單純刷題 app，而是用「大世界 / 小國家 / 概念卡 / 小任務」整理資安、網路、作業系統、計算機架構、密碼學、鑑識、逆向與治理法遵。

## 目前方向

- 英文品牌名：CyberAtlas
- 中文產品名：資安地圖
- 主技術棧：Kotlin Multiplatform + Compose Multiplatform
- 第一版語言：中文版
- 內容策略：先做骨架與少量範例，不一次塞滿教材
- 資料策略：本機 sample data，之後再考慮匯入內容包或後端
- 商業策略：免費，不做訂閱、不塞廣告

## KMP 專案結構

```text
.
├── shared/        # 共用資料模型與內容資料
├── sharedUI/      # Compose Multiplatform 共用 UI
├── androidApp/    # Android 入口
├── iosApp/        # iOS 入口骨架
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

## 舊 SwiftUI 原型

前一版 `Texuan` SwiftUI 原型已從工作目錄移除。需要參考時可從 Git 歷史查看；目前主線開發只走 KMP。
