//
// Created with ❤️ by Daniel Gabzdyl.

import SwiftUI


struct WeekStatus: View {
    
    // MARK: - Input
    
    let progress: Progress
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("week_\(7)")
                    .font(.headline)
                    .foregroundColor(.eel)
                
                Text(progress.localizedWeekStatus)
                    .font(.subheadline)
                    .foregroundColor(.hare)
                
                ProgressBar(
                    current: progress,
                    total: Progress.idealCount,
                    size: .medium,
                    colorway: .success
                )
            }
            .padding(.top, 16)
            .padding(.horizontal)
                                
            Color.swan
                .frame(height: 1)
                .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.polar)
    }
    
    
    // MARK: - Helpers
    
    private func getWeekOfYear() -> Int {
        let calendar = Calendar.current
        return calendar.component(.weekOfYear, from: Date())
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    WeekStatus(progress: 14)
        .padding()
}
