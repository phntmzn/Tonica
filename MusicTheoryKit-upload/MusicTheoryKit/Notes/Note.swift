import Foundation

public struct Note: Equatable, Hashable {
    public let name: NoteName
    public let octave: Int

    public init(_ name: NoteName, octave: Int = 4) {
        self.name = name
        self.octave = octave
    }

    public var midiNumber: UInt8 {
        UInt8((octave + 1) * 12 + name.semitone)
    }

    public func transposed(by semitones: Int) -> Note {
        let midi = Int(midiNumber) + semitones
        let newOctave = midi / 12 - 1
        let newName = NoteName.from(semitone: midi)

        return Note(newName, octave: newOctave)
    }

    public var description: String {
        "\(name.rawValue)\(octave)"
    }
}
