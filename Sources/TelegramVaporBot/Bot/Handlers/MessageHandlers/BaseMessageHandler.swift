import Foundation

/// Option Set for `MessageHandler`
public struct MessageHandlerOptions: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    /// Should “normal” message updates be handled?
    public static let messageUpdates = MessageHandlerOptions(rawValue: 1)
    /// Should channel posts updates be handled?
    public static let channelPostUpdates = MessageHandlerOptions(rawValue: 2)
    /// Should “edited” message updates be handled?
    public static let editedUpdates = MessageHandlerOptions(rawValue: 4)
}

public protocol BaseMessageHandler: HandlerProtocol {
    var filters: Filter { get }
    var options: MessageHandlerOptions { get }
}

public extension BaseMessageHandler {
    func check(update: Update) -> Bool {
        if options.contains(.channelPostUpdates) {
            if update.channelPost != nil {
                return true
            }
            if options.contains(.editedUpdates),
               update.editedChannelPost != nil ||
                update.editedMessage != nil
            {
                return true
            }
        }

        if options.contains(.messageUpdates),
           let message = update.message,
           filters.check(message)
        {
            return true
        }

        return false
    }
}
