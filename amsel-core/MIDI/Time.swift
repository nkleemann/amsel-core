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
     
       We loose precision by casting from
       Double to UInt but rounding errors are in the
       nanoseconds range and can't be perceived.
     
     - Parameters:
        - songTempo: The tempo of the song in beats per minute
     */
    func toMircoSeconds(songTempo: BPM) -> UInt {
        
        // A bar has 4 beats. The Length of a single beat
        // in seconds is calculated by: (60 seconds/BPM).
        let barLengthInSeconds    = 4.0 * (60.0 / Double(songTempo))
        // The total length of the note stays is in relation
        // to the length of a bar.
        let noteDurationInSeconds = self.rawValue * barLengthInSeconds
    
        // Convert to microseconds
        return UInt(noteDurationInSeconds * 1000000)
    }
}
