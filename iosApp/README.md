# iOS 入口骨架

這個資料夾先保留 iOS app shell 的最小檔案。

預期流程：

1. 用 Android Studio / IntelliJ 的 Kotlin Multiplatform wizard 建立或匯入 iOS app target。
2. 讓 iOS target 連到 Gradle 產出的 `SharedUI` framework。
3. 在 SwiftUI 裡呼叫 `MainViewController()`，顯示共用 Compose Multiplatform UI。

目前主要可開發內容在：

- `shared`: 共用資料模型與內容
- `sharedUI`: 共用 Compose UI
- `androidApp`: Android 入口
