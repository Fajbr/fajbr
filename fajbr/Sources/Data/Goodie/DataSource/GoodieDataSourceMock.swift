//
// Created with ❤️ by Daniel Gabzdyl.

import Foundation


class GoodieDataSourceMock: GoodieDataSource {
    
    private let defaultGoodies: [Goodie] = [
        .init(id: 1, name: "goodie_broccoli"),
        .init(id: 2, name: "goodie_cabbage"),
        .init(id: 3, name: "goodie_cauliflower"),
    ]
    
    func goodies() -> [Goodie] {
        return defaultGoodies
    }
    
    func goodie(for id: Int) -> Goodie? {
        return defaultGoodies.first { $0.id == id }
    }
}
