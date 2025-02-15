//
// Created with ❤️ by Daniel Gabzdyl.

import Foundation


protocol GetGoodiesUseCase {
    func callAsFunction() async throws -> [Goodie]
}

protocol GetGoodieUseCase {
    func callAsFunction(for id: Int) async throws -> Goodie?
}

enum GoodieUseCase {
    
    struct GetGoodies: GetGoodiesUseCase {
        
        let dataSource: GoodieDataSource
        
        func callAsFunction() async throws -> [Goodie] {
            return dataSource.goodies()
        }
    }
    
    struct GetGoodie: GetGoodieUseCase {
        
        let dataSource: GoodieDataSource
        
        func callAsFunction(for id: Int) async throws -> Goodie? {
            return dataSource.goodie(for: id)
        }
    }
}
