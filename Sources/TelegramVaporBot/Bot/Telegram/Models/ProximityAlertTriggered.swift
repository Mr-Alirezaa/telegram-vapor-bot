

/**
 This object represents the content of a service message, sent whenever a user in the chat triggers a proximity alert set by another user.

 SeeAlso Telegram Bot API Reference:
 [ProximityAlertTriggered](https://core.telegram.org/bots/api#proximityalerttriggered)
 */
public final class ProximityAlertTriggered: Codable {
    /// Custom keys for coding/decoding `ProximityAlertTriggered` struct
    public enum CodingKeys: String, CodingKey {
        case traveler
        case watcher
        case distance
    }

    /// User that triggered the alert
    public var traveler: User

    /// User that set the alert
    public var watcher: User

    /// The distance between the users
    public var distance: Int

    public init(traveler: User, watcher: User, distance: Int) {
        self.traveler = traveler
        self.watcher = watcher
        self.distance = distance
    }
}
