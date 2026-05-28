import Foundation

public enum ChordType {
    case major
    case minor
    case diminished
    case augmented

    case major7
    case minor7
    case dominant7
    case diminished7
    case halfDiminished7

    case sus2
    case sus4
    case add9
    case minorAdd9
    case major9
    case minor9
    case dominant9

    public var intervals: [Int] {
        switch self {
        case .major:
            return [0, 4, 7]
        case .minor:
            return [0, 3, 7]
        case .diminished:
            return [0, 3, 6]
        case .augmented:
            return [0, 4, 8]

        case .major7:
            return [0, 4, 7, 11]
        case .minor7:
            return [0, 3, 7, 10]
        case .dominant7:
            return [0, 4, 7, 10]
        case .diminished7:
            return [0, 3, 6, 9]
        case .halfDiminished7:
            return [0, 3, 6, 10]

        case .sus2:
            return [0, 2, 7]
        case .sus4:
            return [0, 5, 7]
        case .add9:
            return [0, 4, 7, 14]
        case .minorAdd9:
            return [0, 3, 7, 14]
        case .major9:
            return [0, 4, 7, 11, 14]
        case .minor9:
            return [0, 3, 7, 10, 14]
        case .dominant9:
            return [0, 4, 7, 10, 14]
        }
    }
}
