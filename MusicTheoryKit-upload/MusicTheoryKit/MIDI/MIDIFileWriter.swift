import Foundation

public final class MIDIFileWriter {
    public let ticksPerQuarter: Int

    public init(ticksPerQuarter: Int = 480) {
        self.ticksPerQuarter = ticksPerQuarter
    }

    public func write(events: [MIDIEvent], tempoBPM: Int = 120, to url: URL) throws {
        var data = Data()

        data.append(contentsOf: [
            0x4D, 0x54, 0x68, 0x64,
            0x00, 0x00, 0x00, 0x06,
            0x00, 0x00,
            0x00, 0x01
        ])

        data.append(UInt8((ticksPerQuarter >> 8) & 0xFF))
        data.append(UInt8(ticksPerQuarter & 0xFF))

        var track = Data()
        let microsecondsPerQuarter = 60_000_000 / tempoBPM

        track.append(0x00)
        track.append(contentsOf: [
            0xFF, 0x51, 0x03,
            UInt8((microsecondsPerQuarter >> 16) & 0xFF),
            UInt8((microsecondsPerQuarter >> 8) & 0xFF),
            UInt8(microsecondsPerQuarter & 0xFF)
        ])

        var timedEvents: [(tick: Int, bytes: [UInt8])] = []

        for event in events {
            let startTick = Int(event.startBeat * Double(ticksPerQuarter))
            let endTick = Int((event.startBeat + event.durationBeats) * Double(ticksPerQuarter))

            let noteOnStatus = UInt8(0x90 | (event.channel & 0x0F))
            let noteOffStatus = UInt8(0x80 | (event.channel & 0x0F))

            timedEvents.append((
                tick: startTick,
                bytes: [noteOnStatus, event.note, event.velocity]
            ))

            timedEvents.append((
                tick: endTick,
                bytes: [noteOffStatus, event.note, 0]
            ))
        }

        timedEvents.sort { $0.tick < $1.tick }

        var previousTick = 0

        for event in timedEvents {
            let delta = event.tick - previousTick
            track.append(contentsOf: variableLengthQuantity(delta))
            track.append(contentsOf: event.bytes)
            previousTick = event.tick
        }

        track.append(0x00)
        track.append(contentsOf: [0xFF, 0x2F, 0x00])

        data.append(contentsOf: [0x4D, 0x54, 0x72, 0x6B])

        let trackLength = track.count

        data.append(UInt8((trackLength >> 24) & 0xFF))
        data.append(UInt8((trackLength >> 16) & 0xFF))
        data.append(UInt8((trackLength >> 8) & 0xFF))
        data.append(UInt8(trackLength & 0xFF))

        data.append(track)

        try data.write(to: url)
    }

    private func variableLengthQuantity(_ value: Int) -> [UInt8] {
        var value = value
        var buffer = [UInt8(value & 0x7F)]

        value >>= 7

        while value > 0 {
            buffer.insert(UInt8((value & 0x7F) | 0x80), at: 0)
            value >>= 7
        }

        return buffer
    }
}
