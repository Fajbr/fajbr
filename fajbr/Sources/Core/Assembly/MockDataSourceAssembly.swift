//
//  Created with ❤️ by Daniel Gabzdyl.

import Swinject


class MockDataSourceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(GoodieDataSource.self) { resolver in
            GoodieDataSourceMock()
        }
    }
}
