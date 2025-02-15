//
// Created with ❤️ by Daniel Gabzdyl.

import SwiftUI


struct RoundedButton: View {
    
    // MARK: - Input
    
    var title: LocalizedStringKey
    var fillColor: Color
    var action: () -> Void
    
    
    // MARK: - Body
    
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .fill(fillColor)
                .padding(.horizontal)
                .overlay {
                    Text(title)
                        .foregroundColor(.white)
                        .font(.headline)
                }
        }
        .frame(height: 44)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    Group {
        RoundedButton(title: "submit", fillColor: .beetle) { }
        
        HStack(spacing: 0) {
            RoundedButton(title: "confirm", fillColor: .featherGreen) { }
            
            RoundedButton(title: "reject", fillColor: .cardinal) { }
        }
    }
    .padding(.vertical)
}
