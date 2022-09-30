#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

public class AsyncCommandHandler: CommandHandler, AsyncHandlerProtocol {
    public let asyncCallback: AsyncHandlerCallback

    public init(
        name: String = String(describing: CommandHandler.self),
        commands: Set<String>,
        filters: Filter = .all,
        options: CommandHandler.Options = [],
        botUsername: String? = nil,
        _ callback: @escaping AsyncHandlerCallback
    ) {
        self.asyncCallback = callback
        super.init(name: name, commands: commands, filters: filters, options: options, botUsername: botUsername, { _, _ in })
    }

    func handle(update: Update, bot: BotProtocol) async {
        await Task {
            do {
                try await asyncCallback(update, bot)
            } catch {
                Bot.log.error(error.logMessage)
            }
        }
        .value
    }
}
#endif
