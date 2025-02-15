//
//  Created with ❤️ by Daniel Gabzdyl.

import Testing
@testable import fajbr


@Suite
struct GoodieTests {
    
    let dataSourceMock = GoodieDataSourceMock()
    let getGoodiesUseCase: GoodieUseCase.GetGoodies
    let getGoodieUseCase: GoodieUseCase.GetGoodie
    
    init() {
        getGoodiesUseCase = GoodieUseCase.GetGoodies(dataSource: dataSourceMock)
        getGoodieUseCase = GoodieUseCase.GetGoodie(dataSource: dataSourceMock)
    }
    
    @Test func testGetGoodiesUseCaseReturnsAllGoodies() async throws {
        let goodies = try await getGoodiesUseCase()
        
        #expect(goodies.count == 3)
        #expect(goodies[0].name == "goodie_broccoli")
        #expect(goodies[1].name == "goodie_cabbage")
        #expect(goodies[2].name == "goodie_cauliflower")
    }
    
    @Test func testGetGoodieUseCaseReturnsCorrectGoodie() async throws {
        let goodie = try await getGoodieUseCase(for: 1)
        
        #expect(goodie != nil)
        #expect(goodie?.id == 1)
        #expect(goodie?.name == "goodie_broccoli")
    }
    
    @Test func testGetGoodieUseCaseReturnsNilForInvalidId() async throws {
        let goodie = try await getGoodieUseCase(for: 999)
        
        #expect(goodie == nil)
    }
}
