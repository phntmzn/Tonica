import Foundation

public struct MIDIEvent {
    public let note: UInt8
    public let velocity: UInt8
    public let startBeat: Double
    public let durationBeats: Double
    public let channel: UInt8

    public init(
        note: UInt8,
        velocity: UInt8 = 100,
        startBeat: Double,
        durationBeats: Double,
        channel: UInt8 = 0
    ) {
        self.note = note
        self.velocity = velocity
        self.startBeat = startBeat
        self.durationBeats = durationBeats
        self.channel = channel
    }
}
