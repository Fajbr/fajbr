//
// Created with ❤️ by Daniel Gabzdyl.

import SwiftUI


struct DashboardView: View {
    
    // MARK: - State
    
    @State var selectedTab: BottomTabBarItem = .home
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .home:
                HomeView(selectedTab: $selectedTab)
            case .about:
                AboutView(selectedTab: $selectedTab)
            }
        }
    }
}


#Preview {
    DashboardView()
}
