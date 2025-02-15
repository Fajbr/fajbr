//
//  Created with ❤️ by Daniel Gabzdyl.

import Swinject


class UseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(GetGoodiesUseCase.self) { resolver in
            GoodieUseCase.GetGoodies(dataSource: inject())
        }
    }
}
