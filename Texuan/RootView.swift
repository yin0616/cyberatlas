import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("探索", systemImage: "sparkle.magnifyingglass")
                }

            RescueModeView()
                .tabItem {
                    Label("任務", systemImage: "flag.checkered")
                }

            WeakListView()
                .tabItem {
                    Label("複習", systemImage: "bookmark")
                }

            LibraryView()
                .tabItem {
                    Label("地圖", systemImage: "map")
                }
        }
        .tint(TexuanTheme.ink)
    }
}
