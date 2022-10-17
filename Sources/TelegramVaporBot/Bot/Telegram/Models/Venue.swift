
/// This object represents a venue.
///
/// SeeAlso Telegram Bot API Reference:
/// [Venue](https://core.telegram.org/bots/api#venue)
public final class Venue: Codable {
    /// Custom keys for coding/decoding `Venue` struct
    public enum CodingKeys: String, CodingKey {
        case location
        case title
        case address
        case foursquareID = "foursquare_id"
        case foursquareType = "foursquare_type"
        case googlePlaceID = "google_place_id"
        case googlePlaceType = "google_place_type"
    }

    /// Venue location. Can't be a live location
    public var location: Location

    /// Name of the venue
    public var title: String

    /// Address of the venue
    public var address: String

    /// Optional. Foursquare identifier of the venue
    public var foursquareID: String?

    /// Optional. Foursquare type of the venue. (For example, “arts\_entertainment/default”, “arts\_entertainment/aquarium” or “food/icecream”.)
    public var foursquareType: String?

    /// Optional. Google Places identifier of the venue
    public var googlePlaceID: String?

    /// Optional. Google Places type of the venue. (See supported types.)
    public var googlePlaceType: String?

    public init(
        location: Location,
        title: String,
        address: String,
        foursquareID: String? = nil,
        foursquareType: String? = nil,
        googlePlaceID: String? = nil,
        googlePlaceType: String? = nil
    ) {
        self.location = location
        self.title = title
        self.address = address
        self.foursquareID = foursquareID
        self.foursquareType = foursquareType
        self.googlePlaceID = googlePlaceID
        self.googlePlaceType = googlePlaceType
    }
}
