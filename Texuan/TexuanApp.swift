import SwiftUI

@main
struct TexuanApp: App {
    @StateObject private var store = CardStore()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(store)
        }
    }
}
