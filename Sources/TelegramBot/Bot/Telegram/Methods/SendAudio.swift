import Vapor

/// For sending voice messages, use the sendVoice method instead.

/// Parameters container struct for `sendAudio` method
public struct SendAudioParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Audio file to send. Pass a file\_id as String to send an audio file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an audio file from the Internet, or upload a new one using multipart/form-data. [More information on Sending Files](https://core.telegram.org/bots/api#sending-files)
    public var audio: FileInfo

    /// Audio caption, 0-1024 characters after entities parsing
    public var caption: String?

    /// Mode for parsing entities in the audio caption. See formatting options for more details.
    public var parseMode: ParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse\_mode
    public var captionEntities: [MessageEntity]?

    /// Duration of the audio in seconds
    public var duration: Int?

    /// Performer
    public var performer: String?

    /// Track name
    public var title: String?

    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file\_attach\_name>” if the thumbnail was uploaded using multipart/form-data under <file\_attach\_name>. More information on Sending Files »
    public var thumb: FileInfo?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// If the message is a reply, ID of the original message
    public var replyToMessageID: Int?

    /// Pass True if the message should be sent even if the specified replied-to message is not found
    public var allowSendingWithoutReply: Bool?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: ReplyMarkup?

    /// Custom keys for coding/decoding `SendAudioParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case audio
        case caption
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case duration
        case performer
        case title
        case thumb
        case disableNotification = "disable_notification"
        case protectContent = "protect_content"
        case replyToMessageID = "reply_to_message_id"
        case allowSendingWithoutReply = "allow_sending_without_reply"
        case replyMarkup = "reply_markup"
    }

    public init(
        chatID: ChatID,
        audio: FileInfo,
        caption: String? = nil,
        parseMode: ParseMode? = nil,
        captionEntities: [MessageEntity]? = nil,
        duration: Int? = nil,
        performer: String? = nil,
        title: String? = nil,
        thumb: FileInfo? = nil,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        replyToMessageID: Int? = nil,
        allowSendingWithoutReply: Bool? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) {
        self.chatID = chatID
        self.audio = audio
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.duration = duration
        self.performer = performer
        self.title = title
        self.thumb = thumb
        self.disableNotification = disableNotification
        self.protectContent = protectContent
        self.replyToMessageID = replyToMessageID
        self.allowSendingWithoutReply = allowSendingWithoutReply
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to send audio files, if you want Telegram clients to display them in the music player. Your audio must be in the .MP3 or .M4A format. On success, the sent Message is returned. Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future.
    /// For sending voice messages, use the sendVoice method instead.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SendAudioParams](https://core.telegram.org/bots/api#sendaudio)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SendAudioParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Message` type
    @discardableResult func sendAudio(params: SendAudioParams) throws -> EventLoopFuture<Message> {
        let methodURL: URI = .init(string: getMethodURL("sendAudio"))
        let future: EventLoopFuture<Message> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
