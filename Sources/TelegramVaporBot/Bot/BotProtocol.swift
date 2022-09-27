import Vapor

public protocol BotProtocol {
    var botId: String { get set }
    var tgURI: URI { get set }
    var tgClient: ClientProtocol { get set }
    var connection: ConnectionProtocol { get }

    static var shared: Self { get }

    static var log: Logger { get }

    func start() throws

    @discardableResult
    func getUpdates(params: GetUpdatesParams?) throws -> EventLoopFuture<[Update]>

    @discardableResult
    func setWebhook(params: SetWebhookParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteWebhook(params: DeleteWebhookParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getWebhookInfo() throws -> EventLoopFuture<WebhookInfo>

    @discardableResult
    func getMe() throws -> EventLoopFuture<User>

    @discardableResult
    func logOut() throws -> EventLoopFuture<Bool>

    @discardableResult
    func close() throws -> EventLoopFuture<Bool>

    @discardableResult
    func sendMessage(params: SendMessageParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func forwardMessage(params: ForwardMessageParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func copyMessage(params: CopyMessageParams) throws -> EventLoopFuture<MessageId>

    @discardableResult
    func sendPhoto(params: SendPhotoParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func sendAudio(params: SendAudioParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func sendDocument(params: SendDocumentParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func sendVideo(params: SendVideoParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func sendAnimation(params: SendAnimationParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func sendVoice(params: SendVoiceParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func sendVideoNote(params: SendVideoNoteParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func sendMediaGroup(params: SendMediaGroupParams) throws -> EventLoopFuture<[Message]>

    @discardableResult
    func sendLocation(params: SendLocationParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func editMessageLiveLocation(params: EditMessageLiveLocationParams) throws -> EventLoopFuture<MessageOrBool>

    @discardableResult
    func stopMessageLiveLocation(params: StopMessageLiveLocationParams?) throws -> EventLoopFuture<MessageOrBool>

    @discardableResult
    func sendVenue(params: SendVenueParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func sendContact(params: SendContactParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func sendPoll(params: SendPollParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func sendDice(params: SendDiceParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func sendChatAction(params: SendChatActionParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getUserProfilePhotos(params: GetUserProfilePhotosParams) throws -> EventLoopFuture<UserProfilePhotos>

    @discardableResult
    func getFile(params: GetFileParams) throws -> EventLoopFuture<File>

    @discardableResult
    func banChatMember(params: BanChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unbanChatMember(params: UnbanChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func restrictChatMember(params: RestrictChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func promoteChatMember(params: PromoteChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatAdministratorCustomTitle(params: SetChatAdministratorCustomTitleParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func banChatSenderChat(params: BanChatSenderChatParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unbanChatSenderChat(params: UnbanChatSenderChatParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatPermissions(params: SetChatPermissionsParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func exportChatInviteLink(params: ExportChatInviteLinkParams) throws -> EventLoopFuture<String>

    @discardableResult
    func createChatInviteLink(params: CreateChatInviteLinkParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func editChatInviteLink(params: EditChatInviteLinkParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func revokeChatInviteLink(params: RevokeChatInviteLinkParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func approveChatJoinRequest(params: ApproveChatJoinRequestParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func declineChatJoinRequest(params: DeclineChatJoinRequestParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatPhoto(params: SetChatPhotoParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteChatPhoto(params: DeleteChatPhotoParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatTitle(params: SetChatTitleParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatDescription(params: SetChatDescriptionParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func pinChatMessage(params: PinChatMessageParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unpinChatMessage(params: UnpinChatMessageParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unpinAllChatMessages(params: UnpinAllChatMessagesParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func leaveChat(params: LeaveChatParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getChat(params: GetChatParams) throws -> EventLoopFuture<Chat>

    @discardableResult
    func getChatAdministrators(params: GetChatAdministratorsParams) throws -> EventLoopFuture<[ChatMember]>

    @discardableResult
    func getChatMemberCount(params: GetChatMemberCountParams) throws -> EventLoopFuture<Int>

    @discardableResult
    func getChatMember(params: GetChatMemberParams) throws -> EventLoopFuture<ChatMember>

    @discardableResult
    func setChatStickerSet(params: SetChatStickerSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteChatStickerSet(params: DeleteChatStickerSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerCallbackQuery(params: AnswerCallbackQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setMyCommands(params: SetMyCommandsParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteMyCommands(params: DeleteMyCommandsParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getMyCommands(params: GetMyCommandsParams?) throws -> EventLoopFuture<[BotCommand]>

    @discardableResult
    func setChatMenuButton(params: SetChatMenuButtonParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getChatMenuButton(params: GetChatMenuButtonParams?) throws -> EventLoopFuture<MenuButton>

    @discardableResult
    func setMyDefaultAdministratorRights(params: SetMyDefaultAdministratorRightsParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getMyDefaultAdministratorRights(params: GetMyDefaultAdministratorRightsParams?) throws -> EventLoopFuture<ChatAdministratorRights>

    @discardableResult
    func editMessageText(params: EditMessageTextParams) throws -> EventLoopFuture<MessageOrBool>

    @discardableResult
    func editMessageCaption(params: EditMessageCaptionParams?) throws -> EventLoopFuture<MessageOrBool>

    @discardableResult
    func editMessageMedia(params: EditMessageMediaParams) throws -> EventLoopFuture<MessageOrBool>

    @discardableResult
    func editMessageReplyMarkup(params: EditMessageReplyMarkupParams?) throws -> EventLoopFuture<MessageOrBool>

    @discardableResult
    func stopPoll(params: StopPollParams) throws -> EventLoopFuture<Poll>

    @discardableResult
    func deleteMessage(params: DeleteMessageParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func sendSticker(params: SendStickerParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func getStickerSet(params: GetStickerSetParams) throws -> EventLoopFuture<StickerSet>

    @discardableResult
    func getCustomEmojiStickers(params: GetCustomEmojiStickersParams) throws -> EventLoopFuture<[Sticker]>

    @discardableResult
    func uploadStickerFile(params: UploadStickerFileParams) throws -> EventLoopFuture<File>

    @discardableResult
    func createNewStickerSet(params: CreateNewStickerSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func addStickerToSet(params: AddStickerToSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setStickerPositionInSet(params: SetStickerPositionInSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteStickerFromSet(params: DeleteStickerFromSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setStickerSetThumb(params: SetStickerSetThumbParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerInlineQuery(params: AnswerInlineQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerWebAppQuery(params: AnswerWebAppQueryParams) throws -> EventLoopFuture<SentWebAppMessage>

    @discardableResult
    func sendInvoice(params: SendInvoiceParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func createInvoiceLink(params: CreateInvoiceLinkParams) throws -> EventLoopFuture<String>

    @discardableResult
    func answerShippingQuery(params: AnswerShippingQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerPreCheckoutQuery(params: AnswerPreCheckoutQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setPassportDataErrors(params: SetPassportDataErrorsParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func sendGame(params: SendGameParams) throws -> EventLoopFuture<Message>

    @discardableResult
    func setGameScore(params: SetGameScoreParams) throws -> EventLoopFuture<MessageOrBool>

    @discardableResult
    func getGameHighScores(params: GetGameHighScoresParams) throws -> EventLoopFuture<[GameHighScore]>
}
