//
//
//

//

import Foundation

/// Messages that contain `Game`
public class GameFilter: Filter {

    public var name: String = "forwarded"

    override
    public func filter(message: Message) -> Bool {
        return message.game != nil
    }
}

public extension Filter {
    static var game: GameFilter { GameFilter() }
}
