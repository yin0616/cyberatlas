import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(SampleAtlas.worlds) { world in
                NavigationLink {
                    WorldDetailView(world: world)
                } label: {
                    HStack(spacing: 12) {
                        Text(world.icon)
                            .frame(width: 54, height: 54)
                            .background(Color.blue.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                        VStack(alignment: .leading, spacing: 4) {
                            Text(world.title)
                                .font(.headline)
                            Text(world.summary)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .lineLimit(2)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("資安地圖")
        }
    }
}
