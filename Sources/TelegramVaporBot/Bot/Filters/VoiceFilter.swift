//
//
//

//

import Foundation

/// Messages that contain `Voice`
public class VoiceFilter: Filter {

    public var name: String = "voice"

    override
    public func filter(message: Message) -> Bool {
        return message.voice != nil
    }
}

public extension Filter {
    static var voice: VoiceFilter { VoiceFilter() }
}
