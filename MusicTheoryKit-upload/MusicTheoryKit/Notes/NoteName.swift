import Foundation

public enum NoteName: String, CaseIterable {
    case C
    case Cs = "C#"
    case D
    case Ds = "D#"
    case E
    case F
    case Fs = "F#"
    case G
    case Gs = "G#"
    case A
    case As = "A#"
    case B

    public var semitone: Int {
        switch self {
        case .C: return 0
        case .Cs: return 1
        case .D: return 2
        case .Ds: return 3
        case .E: return 4
        case .F: return 5
        case .Fs: return 6
        case .G: return 7
        case .Gs: return 8
        case .A: return 9
        case .As: return 10
        case .B: return 11
        }
    }

    public static func from(semitone: Int) -> NoteName {
        let value = ((semitone % 12) + 12) % 12

        return NoteName.allCases.first { $0.semitone == value } ?? .C
    }
}
