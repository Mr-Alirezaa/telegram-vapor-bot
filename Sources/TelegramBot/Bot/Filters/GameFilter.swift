import Foundation

/// Messages that contain `Game`
public class GameFilter: Filter {
    public var name = "forwarded"

    override
    public func filter(message: Message) -> Bool {
        message.game != nil
    }
}

public extension Filter {
    static var game: GameFilter { GameFilter() }
}
