/**
 Data and functions
 related to the combination of notes,
 rests and phrases.
 
 We need to make basic assumptions
 to keep things simple here:
 
    1. Time signature is always 4/4
    2. Everything has (yet) to be quantized to 'grid'
    3. Swing is not supported (yet)
*/

/// Musical tempo
typealias BPM = UInt

/**
 A (monophonic) melody is a sequence
 of Events that are either
 Notes (N) or Rests (R).
 */
struct Melody {
    let events: [MelodyEvent]
    let length: Int

    init(from events: [MelodyEvent]) {
        self.events = events
        self.length = events.count
    }
}

/**
 A MelodyEvent is the atom
 of a Melody. It is either
 a Note or a Rest.
 
 Notes have values and a duration,
 Rests are nothing but duration.
 */
enum MelodyEvent {
    case N(Note),
    R(Duration)
    
    var val: SemiTone? {
        switch self {
        case .N(let note): return note.val
        case .R(_):        return nil
        }
    }
    
    var dur: Duration {
        switch self {
        case .N(let note): return note.dur
        case .R(let rest): return rest
        }
    }
}
