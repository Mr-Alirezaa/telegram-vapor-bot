//
//
//

//

import Foundation

/// Messages that contain `Document`
public class DocumentFilter: Filter {

    public var name: String = "document"

    override
    public func filter(message: Message) -> Bool {
        return message.document != nil
    }
}

public extension Filter {
    static var document: DocumentFilter { DocumentFilter() }
}
