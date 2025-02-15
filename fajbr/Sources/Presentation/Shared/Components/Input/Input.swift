//
// Created with ❤️ by Daniel Gabzdyl.

import SwiftUI


struct Input: View {
    
    enum InputState {
        case initial
        case valid
        case invalid(LocalizedStringKey)
    }
    
    
    // MARK: - Input
    
    @Binding var text: String
    let placeholder: LocalizedStringKey?
    let validation: Validation?
    
    
    // MARK: - State
    
    @State private var state: InputState = .initial
    
    
    // MARK: - Computed properties
    
    var strokeColor: Color {
        switch state {
        case .valid:
            return .featherGreen
        case .invalid:
            return .cardinal
        default:
            return .clear
        }
    }
    
    var message: LocalizedStringKey? {
        switch state {
        case .invalid(let message):
            return message
        default:
            return nil
        }
    }
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField(placeholder ?? "", text: $text)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .background(.polar)
                .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .stroke(strokeColor, lineWidth: 1)
                )
                .onChange(of: text) { _, current in
                    validate(text: current)
                }
            
            if let message {
                Text(message)
                    .lineLimit(1, reservesSpace: true)
                    .font(.caption)
                    .foregroundColor(.cardinal)
                    .fixedSize()
            }
        }
        .padding()
        .onAppear {
            guard text.isEmpty == false else {
                return
            }
            
            validate(text: text)
        }
    }
    
    
    // MARK: - Private functions
    
    private func validate(text: String) {
        guard let validation else {
            return
        }
        
        if let error = validation.perform(input: text) {
            state = .invalid(error.message)
        } else {
            state = .valid
        }
    }
}


#Preview("Empty", traits: .sizeThatFitsLayout) {
    Input(
        text: .constant(""),
        placeholder: "preview_your_favorite_vegetable",
        validation: nil
    )
}

#Preview("No Validation", traits: .sizeThatFitsLayout) {
    Input(
        text: .constant("🥕 Carrot"),
        placeholder: "",
        validation: nil
    )
}

#Preview("Valid", traits: .sizeThatFitsLayout) {
    Input(
        text: .constant("🥬 Cabbage"),
        placeholder: "",
        validation: Validation { _ in
            return nil
        }
    )
}

#Preview("Invalid", traits: .sizeThatFitsLayout) {
    Input(
        text: .constant("🍩 Sugar"),
        placeholder: "",
        validation: Validation { _ in
            return .forMessage("preview_sugar_does_not_contain_fiber")
        }
    )
}
