import Foundation

/// Messages that contain `Sticker`
public class StickerFilter: Filter {
    public var name = "sticker"

    override
    public func filter(message: Message) -> Bool {
        message.sticker != nil
    }
}

public extension Filter {
    static var sticker: StickerFilter { StickerFilter() }
}
