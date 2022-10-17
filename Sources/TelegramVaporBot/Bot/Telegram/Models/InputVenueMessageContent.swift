
/// Represents the content of a venue message to be sent as the result of an inline query.
///
/// SeeAlso Telegram Bot API Reference:
/// [InputVenueMessageContent](https://core.telegram.org/bots/api#inputvenuemessagecontent)
public final class InputVenueMessageContent: Codable {
    /// Custom keys for coding/decoding `InputVenueMessageContent` struct
    public enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case title
        case address
        case foursquareID = "foursquare_id"
        case foursquareType = "foursquare_type"
        case googlePlaceID = "google_place_id"
        case googlePlaceType = "google_place_type"
    }

    /// Latitude of the venue in degrees
    public var latitude: Float

    /// Longitude of the venue in degrees
    public var longitude: Float

    /// Name of the venue
    public var title: String

    /// Address of the venue
    public var address: String

    /// Optional. Foursquare identifier of the venue, if known
    public var foursquareID: String?

    /// Optional. Foursquare type of the venue, if known. (For example, “arts\_entertainment/default”, “arts\_entertainment/aquarium” or “food/icecream”.)
    public var foursquareType: String?

    /// Optional. Google Places identifier of the venue
    public var googlePlaceID: String?

    /// Optional. Google Places type of the venue. (See supported types.)
    public var googlePlaceType: String?

    public init(
        latitude: Float,
        longitude: Float,
        title: String,
        address: String,
        foursquareID: String? = nil,
        foursquareType: String? = nil,
        googlePlaceID: String? = nil,
        googlePlaceType: String? = nil
    ) {
        self.latitude = latitude
        self.longitude = longitude
        self.title = title
        self.address = address
        self.foursquareID = foursquareID
        self.foursquareType = foursquareType
        self.googlePlaceID = googlePlaceID
        self.googlePlaceType = googlePlaceType
    }
}
