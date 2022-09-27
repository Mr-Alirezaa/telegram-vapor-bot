import Foundation

public class Filter {
    public enum Operation {
        case and
        case or
        case not
    }

    public typealias Compound = (lhs: Filter, rhs: Filter, op: Operation)

    private var compoundFilter: Compound?

    public init() {}

    init(lhs: Filter, rhs: Filter, op: Operation) {
        compoundFilter = (lhs: lhs, rhs: rhs, op: op)
    }

    public func check(_ mess: Message) -> Bool {
        if let filter = compoundFilter {
            switch filter.op {
            case .and:
                return (filter.lhs).check(mess) && (filter.rhs).check(mess)
            case .or:
                return (filter.lhs).check(mess) || (filter.rhs).check(mess)
            case .not:
                return !(filter.rhs).check(mess)
            }
        } else {
            return filter(message: mess)
        }
    }

    public func filter(message: Message) -> Bool {
        false
    }

    public static func && (lhs: Filter, rhs: Filter) -> Filter {
        Filter(lhs: lhs, rhs: rhs, op: .and)
    }

    public static func || (lhs: Filter, rhs: Filter) -> Filter {
        Filter(lhs: lhs, rhs: rhs, op: .or)
    }

    public static prefix func ! (filter: Filter) -> Filter {
        Filter(lhs: filter, rhs: filter, op: .not)
    }
}
