//
//
//

//

import Foundation

/// Messages that contain `Sticker`
public class StickerFilter: Filter {

    public var name: String = "sticker"

    override
    public func filter(message: Message) -> Bool {
        return message.sticker != nil
    }
}

public extension Filter {
    static var sticker: StickerFilter { StickerFilter() }
}
