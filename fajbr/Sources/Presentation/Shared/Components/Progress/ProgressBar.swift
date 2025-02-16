//
// Created with ❤️ by Daniel Gabzdyl.

import SwiftUI


struct ProgressBar: View {
    
    enum Size {
        case small
        case medium
        
        var height: CGFloat {
            switch self {
            case .small:
                return 16
            case .medium:
                return 24
            }
        }
        
        var maskHeight: CGFloat {
            switch self {
            case .small:
                return 5
            case .medium:
                return 10
            }
        }
    }
    
    enum Colorway {
        case success
        
        var color: Color {
            switch self {
            case .success:
                return .featherGreen
            }
        }
        
        var maskColor: Color {
            switch self {
            case .success:
                return .maskGreen
            }
        }
    }
    
    // MARK: - Input
    
    let current: Int
    let total: Int
    let size: Size
    let colorway: Colorway
    
    
    // MARK: - Computed Properties
    
    private var progress: CGFloat {
        CGFloat(current) / CGFloat(total)
    }
    
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(UIColor.systemGray5))
                    .frame(height: size.height)
                    .overlay(
                        Text("\(current) / \(total)")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.wolf)
                    )
                
                Rectangle()
                    .fill(.featherGreen)
                    .frame(width: max(0, geometry.size.width * progress), height: size.height)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: size.maskHeight)
                                .foregroundColor(.maskGreen)
                                .padding(.top, 5)
                                .padding(.horizontal, 5)
                            
                            Spacer()
                        }
                    )
                
                
                HStack {
                    Spacer()
                    
                    Text("\(current) / \(total)")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .mask {
                    HStack {
                        Rectangle()
                            .frame(width: max(0, geometry.size.width * progress), height: size.height)
                        
                        Spacer()
                    }
                }
            }
        }
        .frame(height: 24)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    Group {
        ProgressBar(current: 10, total: 30, size: .small, colorway: .success)
            .padding(.top)
        
        ProgressBar(current: 15, total: 30, size: .small, colorway: .success)
        ProgressBar(current: 18, total: 30, size: .small, colorway: .success)
        ProgressBar(current: 0, total: 30, size: .small, colorway: .success)
        
        ProgressBar(current: 30, total: 30, size: .small, colorway: .success)
            .padding(.bottom)
    }
    .padding(.horizontal)
}
