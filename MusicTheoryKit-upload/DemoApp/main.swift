import Foundation
import MusicTheoryKit

let chordBuilder = ChordBuilder()

let progression = [
    chordBuilder.build(root: Note(.Fs, octave: 3), type: .minor7),
    chordBuilder.build(root: Note(.D, octave: 3), type: .major7),
    chordBuilder.build(root: Note(.A, octave: 3), type: .major7),
    chordBuilder.build(root: Note(.E, octave: 3), type: .dominant7)
]

var events: [MIDIEvent] = []

let barsPerChord = 2
let beatsPerBar = 4

for chordIndex in 0..<progression.count {
    let chord = progression[chordIndex]
    let startBeat = Double(chordIndex * barsPerChord * beatsPerBar)

    for note in chord {
        events.append(
            MIDIEvent(
                note: note.midiNumber,
                velocity: 90,
                startBeat: startBeat,
                durationBeats: Double(barsPerChord * beatsPerBar),
                channel: 0
            )
        )
    }
}

let writer = MIDIFileWriter()

let outputURL = URL(fileURLWithPath: NSHomeDirectory())
    .appendingPathComponent("Desktop")
    .appendingPathComponent("fsharp_minor_progression.mid")

try writer.write(events: events, tempoBPM: 140, to: outputURL)

print("Wrote MIDI to:")
print(outputURL.path)
