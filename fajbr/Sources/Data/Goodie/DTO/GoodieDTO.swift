//
//  Created with ❤️ by Daniel Gabzdyl.

import Foundation


struct GoodieDTO: DTO {
    let id: Int
    let name: String
}


// MARK: - Mapping

extension GoodieDTO {
    
    func toEntity() -> Goodie {
        return .init(id: id, name: name)
    }
}
