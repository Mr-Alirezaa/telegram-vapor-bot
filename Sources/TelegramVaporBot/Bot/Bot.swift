import Foundation
import Vapor

public final class Bot: BotProtocol {
    public var botId: String
    public var tgURI: URI
    public var tgClient: ClientProtocol
    public var connection: ConnectionProtocol

    public static let standardURL: URI = .init(string: "https://api.telegram.org")
    private static var _shared: Bot!
    private static var configured = false
    public static var log = Logger(label: "com.tgbot")

    private init(connection: ConnectionProtocol,
                 tgClient: ClientProtocol,
                 tgURI: URI,
                 botId: String)
    {
        self.connection = connection
        self.botId = botId
        self.tgURI = tgURI
        self.tgClient = tgClient
        Self.configured = true
    }

    public func start() throws {
        try connection.start()
    }

    public static var shared: Bot {
        if !configured {
            fatalError("Bot is not configured ! Please call Bot.configure method before")
        }
        return Self._shared
    }

    public static func configure(connection: ConnectionProtocol,
                                 botId: String,
                                 tgURI: URI = Bot.standardURL,
                                 tgClient: ClientProtocol)
    {
        if configured { return }
        Self._shared = Self(connection: connection, tgClient: tgClient, tgURI: tgURI, botId: botId)
        Self._shared.connection.bot = Self._shared
    }

    public static func configure(connection: ConnectionProtocol,
                                 botId: String,
                                 tgURI: URI = Bot.standardURL,
                                 vaporClient: Vapor.Client)
    {
        configure(connection: connection, botId: botId, tgURI: tgURI, tgClient: DefaultClient(client: vaporClient))
    }

    public func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }
}
