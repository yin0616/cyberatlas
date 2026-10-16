# iOS 原生入口

這個資料夾使用 SwiftUI 實作 iOS 原生畫面，不再依賴 SharedUI 或 Kotlin Multiplatform。

正式 Xcode 專案是 `iosApp/Xcode/CyberAtlas.xcodeproj`，原生 SwiftUI 程式碼位於
`iosApp/Xcode/CyberAtlas/`。請用 Xcode 開啟 `.xcodeproj`，再選擇 `CyberAtlas` scheme。

目前已放入原生 SwiftUI 的地圖、世界詳細頁與概念卡示範；iOS 完整建置與模擬器執行仍需在本機 Xcode/CoreSimulator 服務正常時驗證。
