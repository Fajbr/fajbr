//
// Created with ❤️ by Daniel Gabzdyl.

import SwiftUI


struct HomeView: View {
    
    // MARK: - Input
    
    @Binding var selectedTab: BottomTabBarItem
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                WeekStatus(progress: 15)
                
                List {
                    
                }
                .background(Color.white)
            }
            .padding(.bottom, BottomTabBar.height)
            .scrollContentBackground(.hidden)
        }
        .overlay(
            VStack {
                Spacer()
                BottomTabBar(selectedItem: $selectedTab)
            }
        )
    }
}


#Preview {
    HomeView(selectedTab: .constant(.home))
}
