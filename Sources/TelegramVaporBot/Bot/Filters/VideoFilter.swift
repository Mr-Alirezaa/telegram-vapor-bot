//
//
//

//

import Foundation

/// Messages that contain `Video`
public class VideoFilter: Filter {

    public var name: String = "video"

    override
    public func filter(message: Message) -> Bool {
        return message.video != nil
    }
}

public extension Filter {
    static var video: VideoFilter { VideoFilter() }
}
