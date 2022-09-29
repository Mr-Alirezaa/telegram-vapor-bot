import AsyncHTTPClient

/// Handler for bot messages, can handle normal messages, channel posts, edited messages
public class MessageHandler: HandlerProtocol {
    public var id = 0
    /// Name of particular MessageHandler, needed for determine handlers instances of one class in groups
    public var name: String

    /// Option Set for `MessageHandler`
    public struct Options: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        /// Should “normal” message updates be handled?
        public static let messageUpdates = Options(rawValue: 1)
        /// Should channel posts updates be handled?
        public static let channelPostUpdates = Options(rawValue: 2)
        /// Should “edited” message updates be handled?
        public static let editedUpdates = Options(rawValue: 4)
    }

    public let callback: HandlerCallback
    let filters: Filter
    let options: Options

    public init(
        name: String = String(describing: MessageHandler.self),
        filters: Filter = .all,
        options: Options = [.messageUpdates, .channelPostUpdates],
        _ callback: @escaping HandlerCallback
    ) {
        self.filters = filters
        self.callback = callback
        self.options = options
        self.name = name
    }

    public func check(update: Update) -> Bool {
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
