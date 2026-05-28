import Foundation

public final class ScaleBuilder {
    public init() {}

    public func build(root: Note, type: ScaleType) -> [Note] {
        type.intervals.map { root.transposed(by: $0) }
    }
}
