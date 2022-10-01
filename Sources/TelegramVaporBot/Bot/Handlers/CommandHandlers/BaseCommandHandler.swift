import Foundation

public struct CommandHandlerOptions: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    /// Determines Whether the handler should also accept edited messages. Not used by default.
    public static let editedUpdates = CommandHandlerOptions(rawValue: 1)
}

public protocol BaseCommandHandler: HandlerProtocol {
    var commands: Set<String> { get }
    var filters: Filter { get }
    var options: CommandHandlerOptions { get }
    var botUsername: String? { get }
}

public extension BaseCommandHandler {
    func check(update: Update) -> Bool {
        if options.contains(.editedUpdates),
           update.editedMessage != nil || update.editedChannelPost != nil
        {
            return true
        }

        guard let message = update.message,
              filters.check(message),
              let text = message.text?.utf16,
              let entities = message.entities else { return false }

        let types = entities.compactMap { entity -> String? in
            let start = text.index(text.startIndex, offsetBy: entity.offset)
            let end = text.index(start, offsetBy: entity.length - 1)
            let command = String(text[start ... end])
            // If the user specifies the bot using "@"
            // and `botUsername` is not nil,
            // check the bot name and then ignore it for further match.
            let split = command?.split(separator: "@") ?? []
            if split.count == 2, let username = botUsername {
                let commandWithoutMention = split[0]
                let specifiedBot = split[1]
                return specifiedBot == username ? String(commandWithoutMention) : nil
            } else {
                return command
            }
        }
        return !commands.intersection(types).isEmpty
    }
}
