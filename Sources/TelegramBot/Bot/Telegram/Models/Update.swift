
/// This object represents an incoming update.
/// At most one of the optional parameters can be present in any given update.
///
/// SeeAlso Telegram Bot API Reference:
/// [Update](https://core.telegram.org/bots/api#update)
public final class Update: Codable {
    /// Custom keys for coding/decoding `Update` struct
    public enum CodingKeys: String, CodingKey {
        case updateID = "update_id"
        case message
        case editedMessage = "edited_message"
        case channelPost = "channel_post"
        case editedChannelPost = "edited_channel_post"
        case inlineQuery = "inline_query"
        case chosenInlineResult = "chosen_inline_result"
        case callbackQuery = "callback_query"
        case shippingQuery = "shipping_query"
        case preCheckoutQuery = "pre_checkout_query"
        case poll
        case pollAnswer = "poll_answer"
        case myChatMember = "my_chat_member"
        case chatMember = "chat_member"
        case chatJoinRequest = "chat_join_request"
    }

    /// The update's unique identifier. Update identifiers start from a certain positive number and increase sequentially. This ID becomes especially handy if you're using webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially.
    public var updateID: Int

    /// Optional. New incoming message of any kind - text, photo, sticker, etc.
    public var message: Message?

    /// Optional. New version of a message that is known to the bot and was edited
    public var editedMessage: Message?

    /// Optional. New incoming channel post of any kind - text, photo, sticker, etc.
    public var channelPost: Message?

    /// Optional. New version of a channel post that is known to the bot and was edited
    public var editedChannelPost: Message?

    /// Optional. New incoming inline query
    public var inlineQuery: InlineQuery?

    /// Optional. The result of an inline query that was chosen by a user and sent to their chat partner. Please see our documentation on the feedback collecting for details on how to enable these updates for your bot.
    public var chosenInlineResult: ChosenInlineResult?

    /// Optional. New incoming callback query
    public var callbackQuery: CallbackQuery?

    /// Optional. New incoming shipping query. Only for invoices with flexible price
    public var shippingQuery: ShippingQuery?

    /// Optional. New incoming pre-checkout query. Contains full information about checkout
    public var preCheckoutQuery: PreCheckoutQuery?

    /// Optional. New poll state. Bots receive only updates about stopped polls and polls, which are sent by the bot
    public var poll: Poll?

    /// Optional. A user changed their answer in a non-anonymous poll. Bots receive new votes only in polls that were sent by the bot itself.
    public var pollAnswer: PollAnswer?

    /// Optional. The bot's chat member status was updated in a chat. For private chats, this update is received only when the bot is blocked or unblocked by the user.
    public var myChatMember: ChatMemberUpdated?

    /// Optional. A chat member's status was updated in a chat. The bot must be an administrator in the chat and must explicitly specify “chat\_member” in the list of allowed\_updates to receive these updates.
    public var chatMember: ChatMemberUpdated?

    /// Optional. A request to join the chat has been sent. The bot must have the can\_invite\_users administrator right in the chat to receive these updates.
    public var chatJoinRequest: ChatJoinRequest?

    public init(
        updateID: Int,
        message: Message? = nil,
        editedMessage: Message? = nil,
        channelPost: Message? = nil,
        editedChannelPost: Message? = nil,
        inlineQuery: InlineQuery? = nil,
        chosenInlineResult: ChosenInlineResult? = nil,
        callbackQuery: CallbackQuery? = nil,
        shippingQuery: ShippingQuery? = nil,
        preCheckoutQuery: PreCheckoutQuery? = nil,
        poll: Poll? = nil,
        pollAnswer: PollAnswer? = nil,
        myChatMember: ChatMemberUpdated? = nil,
        chatMember: ChatMemberUpdated? = nil,
        chatJoinRequest: ChatJoinRequest? = nil
    ) {
        self.updateID = updateID
        self.message = message
        self.editedMessage = editedMessage
        self.channelPost = channelPost
        self.editedChannelPost = editedChannelPost
        self.inlineQuery = inlineQuery
        self.chosenInlineResult = chosenInlineResult
        self.callbackQuery = callbackQuery
        self.shippingQuery = shippingQuery
        self.preCheckoutQuery = preCheckoutQuery
        self.poll = poll
        self.pollAnswer = pollAnswer
        self.myChatMember = myChatMember
        self.chatMember = chatMember
        self.chatJoinRequest = chatJoinRequest
    }
}

extension Update {
    /// Convenient access to `from` property in different Update types.
    var from: TelegramVaporBot.User? {
        if let from = message?.from {
            return from
        }
        if let from = message?.from {
            return from
        }
        if let from = editedMessage?.from {
            return from
        }
        if let from = channelPost?.from {
            return from
        }
        if let from = editedChannelPost?.from {
            return from
        }
        if let from = inlineQuery?.from {
            return from
        }
        if let from = chosenInlineResult?.from {
            return from
        }
        if let from = callbackQuery?.from {
            return from
        }
        if let from = shippingQuery?.from {
            return from
        }
        if let from = preCheckoutQuery?.from {
            return from
        }
        if let from = myChatMember?.from {
            return from
        }
        if let from = chatJoinRequest?.from {
            return from
        }
        return nil
    }
}
