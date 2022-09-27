

/**
 This object represents a service message about new members invited to a video chat.

 SeeAlso Telegram Bot API Reference:
 [VideoChatParticipantsInvited](https://core.telegram.org/bots/api#videochatparticipantsinvited)
 */
public final class VideoChatParticipantsInvited: Codable {

    /// Custom keys for coding/decoding `VideoChatParticipantsInvited` struct
    public enum CodingKeys: String, CodingKey {
        case users = "users"
    }

    /// New members that were invited to the video chat
    public var users: [User]

    public init (users: [User]) {
        self.users = users
    }
}
