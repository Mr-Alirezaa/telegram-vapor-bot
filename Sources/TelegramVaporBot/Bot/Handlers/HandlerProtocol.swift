

import Foundation

public typealias HandlerCallback = (_ update: Update, _ bot: BotProtocol) throws -> Void

public protocol HandlerProtocol {

    var id: Int { get set }
    var name: String { get }

    func check(update: Update) -> Bool
    func handle(update: Update, bot: BotProtocol)
}

extension HandlerProtocol {
    public var name: String {
        return String(describing: Self.self)
    }
}
