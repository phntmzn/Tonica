import Foundation

public enum ScaleType {
    case major
    case naturalMinor
    case harmonicMinor
    case melodicMinor
    case pentatonicMajor
    case pentatonicMinor
    case dorian
    case phrygian
    case lydian
    case mixolydian
    case locrian

    public var intervals: [Int] {
        switch self {
        case .major:
            return [0, 2, 4, 5, 7, 9, 11]
        case .naturalMinor:
            return [0, 2, 3, 5, 7, 8, 10]
        case .harmonicMinor:
            return [0, 2, 3, 5, 7, 8, 11]
        case .melodicMinor:
            return [0, 2, 3, 5, 7, 9, 11]
        case .pentatonicMajor:
            return [0, 2, 4, 7, 9]
        case .pentatonicMinor:
            return [0, 3, 5, 7, 10]
        case .dorian:
            return [0, 2, 3, 5, 7, 9, 10]
        case .phrygian:
            return [0, 1, 3, 5, 7, 8, 10]
        case .lydian:
            return [0, 2, 4, 6, 7, 9, 11]
        case .mixolydian:
            return [0, 2, 4, 5, 7, 9, 10]
        case .locrian:
            return [0, 1, 3, 5, 6, 8, 10]
        }
    }
}
