/**
 In the context of a concrete piece
 of music, the 'pure' concept of
 duration becomes physical time,
 measured in seconds.
 */
extension Duration {
    
    /**
     Convert a musical duration into microseconds
     based on the given song tempo.
     
     - Parameters:
        - songTempo: The tempo of the song in beats per minute
     */
    func toMircoSeconds(songTempo: BPM) -> UInt {
        // Beats per seconds, can be rational
        let bps = Double(bpm) / 60.0
        
        // Time in seconds
        let secs: Double = self.rawValue * bps
        
        // Convert to microseconds and return
        // We loose precision here but in music
        // latency up to 3-5 milliseconds can't
        // even be perceived by experienced performers.
        // Losses by this cast should stay in the
        // micro & nanoseconds range.
        return UInt(secs * 1000000)
    }
}
