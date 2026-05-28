import Foundation

public final class ChordBuilder {
    public init() {}

    public func build(root: Note, type: ChordType) -> [Note] {
        type.intervals.map { root.transposed(by: $0) }
    }

    public func invert(_ chord: [Note], inversion: Int) -> [Note] {
        guard !chord.isEmpty else { return chord }

        var result = chord

        for _ in 0..<inversion {
            let first = result.removeFirst()
            result.append(first.transposed(by: 12))
        }

        return result
    }
}
