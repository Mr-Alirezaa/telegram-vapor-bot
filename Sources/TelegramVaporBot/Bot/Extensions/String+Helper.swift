import Foundation
import Logging
import SwiftRegularExpression

public extension String {
    func matchRegex(pattern: String) -> Bool {
        regexp(pattern).keys.count > 0
    }
}

public extension String {
    var logMessage: Logger.Message {
        Logger.Message(stringLiteral: self)
    }
}
