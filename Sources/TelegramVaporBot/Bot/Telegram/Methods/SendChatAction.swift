import Vapor

/// Example: The ImageBot needs some time to process a request and upload the image. Instead of sending a text message along the lines of “Retrieving image, please wait…”, the bot may use sendChatAction with action = upload\_photo. The user will see a “sending photo” status for the bot.
/// We only recommend using this method when a response from the bot will take a noticeable amount of time to arrive.

/// Parameters container struct for `sendChatAction` method
public struct SendChatActionParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Type of action to broadcast. Choose one, depending on what the user is about to receive: typing for text messages, upload\_photo for photos, record\_video or upload\_video for videos, record\_voice or upload\_voice for voice notes, upload\_document for general files, choose\_sticker for stickers, find\_location for location data, record\_video\_note or upload\_video\_note for video notes.
    public var action: String

    /// Custom keys for coding/decoding `SendChatActionParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case action
    }

    public init(chatID: ChatID, action: String) {
        self.chatID = chatID
        self.action = action
    }
}

public extension Bot {
    /// Use this method when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success.
    /// Example: The ImageBot needs some time to process a request and upload the image. Instead of sending a text message along the lines of “Retrieving image, please wait…”, the bot may use sendChatAction with action = upload\_photo. The user will see a “sending photo” status for the bot.
    /// We only recommend using this method when a response from the bot will take a noticeable amount of time to arrive.

    /// SeeAlso Telegram Bot API Reference:
    /// [SendChatActionParams](https://core.telegram.org/bots/api#sendchataction)

    /// - Parameters:
    ///     - params: Parameters container, see `SendChatActionParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func sendChatAction(params: SendChatActionParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("sendChatAction"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
