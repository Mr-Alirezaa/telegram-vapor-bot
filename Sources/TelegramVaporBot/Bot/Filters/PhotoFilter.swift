//
//
//

//

import Foundation

/// Messages that contain `[PhotoSize]`
public class PhotoFilter: Filter {

    public var name: String = "photo"

    override
    public func filter(message: Message) -> Bool {
        guard let photos = message.photo else { return false }
        return !photos.isEmpty
    }
}

public extension Filter {
    static var photo: PhotoFilter { PhotoFilter() }
}
