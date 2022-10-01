import Foundation
import Logging

public class LoggerHandler: HandlerProtocol {
    public var id = 0

    let logLevel: Logger.Level

    public init(level: Logger.Level) {
        logLevel = level
    }

    public func check(update: Update) -> Bool {
        true
    }

    public func handle(update: Update, bot: BotProtocol) {
        Bot.log.log(level: logLevel, update.logMessage)
    }
}

extension Update {
    var description: String {
        // TODO: Improve description algorithm, serialization/deserialization too heavy
        var resultString = "[]"

        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(self)
            if let json = String(data: data, encoding: .utf8) {
                resultString = json
            }
        } catch {
            Bot.log.error(error.logMessage)
        }
        return resultString
    }

    var logMessage: Logger.Message {
        Logger.Message(stringLiteral: description)
    }
}

extension Array where Element: Update {
    var description: String {
        var str = ""
        forEach { elem in
            str.append(elem.description)
            str.append("\n")
        }
        return str
    }
}
