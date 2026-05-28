import Foundation

public struct RhythmHit {
    public let beat: Double
    public let duration: Duration
    public let velocity: UInt8

    public init(
        beat: Double,
        duration: Duration,
        velocity: UInt8 = 100
    ) {
        self.beat = beat
        self.duration = duration
        self.velocity = velocity
    }
}

public struct RhythmPattern {
    public let hits: [RhythmHit]

    public init(hits: [RhythmHit]) {
        self.hits = hits
    }

    public static func fourOnTheFloor(bars: Int) -> RhythmPattern {
        var hits: [RhythmHit] = []

        for bar in 0..<bars {
            let offset = Double(bar * 4)

            hits.append(RhythmHit(beat: offset + 0, duration: .quarter))
            hits.append(RhythmHit(beat: offset + 1, duration: .quarter))
            hits.append(RhythmHit(beat: offset + 2, duration: .quarter))
            hits.append(RhythmHit(beat: offset + 3, duration: .quarter))
        }

        return RhythmPattern(hits: hits)
    }

    public static func eighthNoteHats(bars: Int) -> RhythmPattern {
        var hits: [RhythmHit] = []

        for bar in 0..<bars {
            let offset = Double(bar * 4)

            for i in 0..<8 {
                hits.append(
                    RhythmHit(
                        beat: offset + Double(i) * 0.5,
                        duration: .eighth,
                        velocity: i % 2 == 0 ? 90 : 60
                    )
                )
            }
        }

        return RhythmPattern(hits: hits)
    }

    public static func tresillo(bars: Int) -> RhythmPattern {
        var hits: [RhythmHit] = []

        for bar in 0..<bars {
            let offset = Double(bar * 4)

            hits.append(RhythmHit(beat: offset + 0.0, duration: .eighth, velocity: 110))
            hits.append(RhythmHit(beat: offset + 1.5, duration: .eighth, velocity: 100))
            hits.append(RhythmHit(beat: offset + 3.0, duration: .eighth, velocity: 105))
        }

        return RhythmPattern(hits: hits)
    }
}
