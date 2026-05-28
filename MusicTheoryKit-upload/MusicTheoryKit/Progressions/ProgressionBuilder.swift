import Foundation

public struct ChordSymbol {
    public let root: Note
    public let type: ChordType

    public init(root: Note, type: ChordType) {
        self.root = root
        self.type = type
    }
}

public final class ProgressionBuilder {
    private let chordBuilder = ChordBuilder()

    public init() {}

    public func build(_ symbols: [ChordSymbol]) -> [[Note]] {
        symbols.map { symbol in
            chordBuilder.build(root: symbol.root, type: symbol.type)
        }
    }
}
