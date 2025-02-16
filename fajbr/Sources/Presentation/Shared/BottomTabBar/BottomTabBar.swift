//
//  BottomTabBar.swift
//  theUntanglers
//
//  Created by Daniel Gabzdyl on 06.01.2025.
//

import SwiftUI


enum BottomTabBarItem {
    case home
    case about
}


struct BottomTabBar: View {
    
    static var height: CGFloat = 64
        
    @Binding var selectedItem: BottomTabBarItem
        
    private let y: CGFloat = 22
    private let offset: CGFloat = 100
    
    private func position(of number: Int, width: CGFloat) -> CGFloat {
        let firstToLastDistance = width - 2 * offset
        let interItemSpace = firstToLastDistance / (CGFloat(tabs.count) - 1)
        return CGFloat(number) * interItemSpace + offset
    }
    
    private let tabs: [(icon: Image, text: Text, item: BottomTabBarItem)] = [
        (icon: Image(systemName: "house"), text: Text("dashboard_tab_home"), item: .home),
        (icon: Image(systemName: "info"), text: Text("dashboard_tab_about"), item: .about)
    ]
    
    var body: some View {
        ZStack {
            HStack {
                Color.white
                    .frame(height: 44)
                    .offset(y: 44)
            }
            .ignoresSafeArea(edges: .bottom)
            
            VStack {
                Color.polar
                    .frame(height: 1)
                    .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                
                GeometryReader { proxy in
                    ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
                        BottomTabView(icon: tab.icon, text: tab.text, item: tab.item, selectedItem: $selectedItem)
                            .position(x: position(of: index, width: proxy.size.width), y: y)
                    }
                }
            }
            .frame(height: BottomTabBar.height)
            .background(.thinMaterial)
        }
    }
}

struct BottomTabView: View {
    var icon: Image
    var text: Text
    var item: BottomTabBarItem
    @Binding var selectedItem: BottomTabBarItem
            
    private var isSelected: Bool {
        item == selectedItem
    }
    
    var body: some View {
        Button(action: {
            selectedItem = item
            UIImpactFeedbackGenerator(style: .rigid).impactOccurred(intensity: 0.6)
        }) {
            VStack(spacing: 2) {
                icon
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? Color.accent : .eel)
                
                text
                    .font(.caption2)
                    .foregroundColor(isSelected ? Color.accent : .eel)
            }
        }
        .disabled(isSelected)
    }
}


#Preview {
    ZStack {
        ScrollView {
            ForEach(0..<5) { index in
                RoundedRectangle(cornerRadius: 10)
                    .fill([.beetle, .bee, .maskGreen, .featherGreen, .wolf, .cardinal].randomElement() ?? .polar)
                    .frame(height: 200)
                    .padding(.horizontal)
                    .padding(.bottom, index == 4 ? BottomTabBar.height : 0)
            }
        }
        
        VStack {
            Spacer()
            BottomTabBar(selectedItem: .constant(.home))
        }
    }
}
