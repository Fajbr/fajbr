//
// Created with ❤️ by Daniel Gabzdyl.

import SwiftUI


struct AboutView: View {
    
    // MARK: - Input
    
    @Binding var selectedTab: BottomTabBarItem
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                        Text("version: \(version)")
                    }
                    if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
                        Text("build: \(build)")
                    }
                } header: {
                    Text("general_information")
                }
                .listRowBackground(Color.polar)
            }
            .padding(.bottom, BottomTabBar.height)
            .scrollContentBackground(.hidden)
            .background(Color.white)
            .navigationTitle("about")
            .navigationBarTitleDisplayMode(.inline)
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
    AboutView(selectedTab: .constant(.about))
}
