//
//
//

//

import Foundation

/// Messages that contain `Audio`
public class AudioFilter: Filter {
    public var name: String = "audio"

    override
    public func filter(message: Message) -> Bool {
        return message.audio != nil
    }
}

public extension Filter {
    static var audio: AudioFilter { AudioFilter() } 
}
