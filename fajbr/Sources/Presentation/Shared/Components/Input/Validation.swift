//
// Created with ❤️ by Daniel Gabzdyl.

import SwiftUI


class Validation {

    struct Error {
        let message: LocalizedStringKey

        static func forMessage(_ message: LocalizedStringKey) -> Error {
            Error(message: message)
        }
    }


    // MARK: - Private properties

    private var validationBlock: (String) -> Error?


    // MARK: - Initialization

    init(_ block: @escaping ((String) -> Error?)) {
        validationBlock = block
    }


    // MARK: - Internal methods

    internal func perform(input: String) -> Error? {
        validationBlock(input)
    }

}
