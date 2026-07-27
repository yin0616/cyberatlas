# KMP 開發筆記：CyberAtlas / 資安地圖

## 技術選型

第一版採用：

- Kotlin Multiplatform
- Compose Multiplatform
- Android app module
- iOS SwiftUI shell + KMP framework
- 本機 sample data

暫時不接：

- 後端
- 登入
- Push notification
- 付費
- analytics

## 模組分工

```text
shared/
  共用資料模型、內容資料、之後的 repository / use case

sharedUI/
  Compose Multiplatform 共用畫面
  Android 和 iOS 都吃這一層 UI

androidApp/
  Android Activity、manifest、平台設定

iosApp/
  iOS SwiftUI shell
  之後接 SharedUI framework
```

## 資料流

目前先走最小資料流：

```text
SampleAtlas
  -> CyberAtlasApp
  -> WorldMapScreen
  -> WorldDetailScreen
  -> ConceptCardBlock
```

之後可以演進成：

```text
ContentRepository
  -> GetWorldsUseCase
  -> AtlasViewModel
  -> Compose UI
```

## 內容資料格式

目前 Kotlin model：

- `AtlasWorld`
- `ConceptCountry`
- `ConceptCard`
- `CardKind`

第一版先把內容寫在 `SampleAtlas.kt`，等格式穩定後再搬成 JSON、SQLite、SQLDelight 或遠端內容包。

## UI 優先順序

1. 地圖首頁
2. 世界詳情
3. 概念卡詳情
4. 收藏 / 待複習
5. 搜尋
6. 學習路線
7. 小任務互動

## 中文版規則

- UI 文案先全中文
- 內容先全中文
- 英文術語可以放在內文括號中，但不做完整英文版
- 程式碼命名維持英文，避免 KMP / iOS 匯出時踩工具鏈問題

## 目前尚未處理

- Gradle wrapper 尚未加入
- iOS Xcode project 尚未完整建立
- Android / iOS 實機畫面尚未截圖驗證
- 尚未接 persistence
- 尚未做 navigation framework
