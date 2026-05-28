import Foundation

public enum MusicMath {
    public static func beatsToTicks(_ beats: Double, ppq: Int = 480) -> Int {
        Int(beats * Double(ppq))
    }

    public static func barsToBeats(_ bars: Int, beatsPerBar: Int = 4) -> Double {
        Double(bars * beatsPerBar)
    }

    public static func bpmToMicrosecondsPerQuarter(_ bpm: Int) -> Int {
        60_000_000 / bpm
    }
}
