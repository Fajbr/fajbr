//
// Created with ❤️ by Daniel Gabzdyl.

import SwiftUI


typealias Progress = Int

extension Progress {
    static var idealCount = 30
    
    var localizedWeekStatus: LocalizedStringKey {
        switch self {
        case 0..<10:
            return "week_status_0_10"
        case 10..<20:
            return "week_status_10_20"
        case 20..<30:
            return "week_status_20_30"
        default:
            return "week_status_30"
        }
    }
}
