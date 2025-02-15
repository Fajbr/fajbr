//
//  Created with ❤️ by Daniel Gabzdyl.

import Foundation


protocol GoodieDataSource {
    func goodies() -> [Goodie]
    func goodie(for id: Int) -> Goodie?
}
