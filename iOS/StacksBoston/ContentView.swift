import SwiftUI

struct ContentView: View {
    @State private var currentTab: Int = 0

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TabBarView(currentTab: $currentTab)
                    .padding(.top, 2)

                TabView(selection: $currentTab) {
                    View1().tag(0)
                    View2().tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Home")
        }
    }
}

struct View1: View {
    var body: some View {
        ZStack {
            Color(.blue.opacity(0.2))
                .frame(width: 100, height: 100)
        }
    }
}

struct View2: View {
    var body: some View {
        ZStack {
            Color(.red.opacity(0.2))
                .frame(width: 100, height: 100)
        }
    }
}

struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["For you", "Following"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        id: \.0,
                        content: {
                    index, name in
                    TabBarItem(currentTab: self.$currentTab,
                               namespace: namespace.self,
                               tabBarItemName: name,
                               tab: index)
                    
                })
            }
            .padding(.horizontal)
        }
        .frame(height: 80)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Text(tabBarItemName)
                    .foregroundStyle(.white)
                if currentTab == tab {
                    Color.orange
                        .frame(height: 3)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                } else {
                    Color.clear.frame(height: 3)
                }
            }
            .animation(.spring(duration: 0.3), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
