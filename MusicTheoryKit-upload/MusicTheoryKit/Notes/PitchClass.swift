import Foundation

public struct PitchClass {
    public let value: Int

    public init(_ value: Int) {
        self.value = ((value % 12) + 12) % 12
    }

    public func transposed(by semitones: Int) -> PitchClass {
        PitchClass(value + semitones)
    }
}
