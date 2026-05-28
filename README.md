# MusicTheoryKit

A lightweight Swift framework for music theory, chords, scales, rhythm patterns, progressions, and simple MIDI file generation.

MusicTheoryKit is an Xcode `.framework` project, not a Swift Package. It is designed to be opened and built directly in Xcode or with `xcodebuild`.

## Features

- Build notes and pitch classes
- Transpose notes by semitone
- Generate major, minor, pentatonic, and modal scales
- Generate triads, seventh chords, suspended chords, add9 chords, and ninth chords
- Build chord progressions from symbols
- Create common rhythm patterns
- Write simple standard MIDI files

## Project Structure

```text
MusicTheoryKit/
├── MusicTheoryKit.xcodeproj
├── MusicTheoryKit/
│   ├── MusicTheoryKit.h
│   ├── Notes/
│   ├── Scales/
│   ├── Chords/
│   ├── Progressions/
│   ├── Rhythm/
│   ├── MIDI/
│   └── Utilities/
└── DemoApp/
    └── main.swift
```

## Build

Open `MusicTheoryKit.xcodeproj` in Xcode and build the `MusicTheoryKit` scheme.

You can also build from the terminal:

```bash
xcodebuild \
  -project MusicTheoryKit.xcodeproj \
  -scheme MusicTheoryKit \
  -configuration Release \
  -derivedDataPath Build/DerivedData \
  build
```

The framework output will be created at:

```text
Build/DerivedData/Build/Products/Release/MusicTheoryKit.framework
```

## Demo App

Build the included demo app:

```bash
xcodebuild \
  -project MusicTheoryKit.xcodeproj \
  -scheme DemoApp \
  -configuration Release \
  -derivedDataPath Build/DerivedData \
  build
```

## Usage

```swift
import MusicTheoryKit

let scale = ScaleBuilder().build(
    root: Note(.Fs, octave: 4),
    type: .naturalMinor
)

print(scale.map { $0.description })
// ["F#4", "G#4", "A4", "B4", "C#5", "D5", "E5"]
```

```swift
let chord = ChordBuilder().build(
    root: Note(.D, octave: 4),
    type: .major9
)

print(chord.map { $0.description })
```

```swift
let event = MIDIEvent(
    note: 60,
    velocity: 100,
    startBeat: 0,
    durationBeats: 1,
    channel: 0
)
```

## License

MIT
