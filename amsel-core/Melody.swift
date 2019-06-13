/**
 Data and functions
 related to the combination of notes,
 rests and phrases.
 
 We need to make basic assumptions
 to keep things simple here:
 
    1. Time signature is always 4/4
    2. Everything has (yet) to be quantized
    3. Swing is not supported (yet)
*/

/// Sequence of notes and rests
typealias Melody = [MelodyPart]
/// Tonic with scale
typealias Key = (Note, Scale)
/// Musical tempo
typealias BPM = UInt

/**
 A (monophonic) melody is a sequence
 containing Notes (N) and Rests (R).
 
 Notes have values and a duration,
 Rests are nothing but duration.
*/
enum MelodyPart {
    case N(Note),
         R(Rest)
    
    var val: SemiTone? {
        switch self {
            case .N(let note): return note.val
            case .R(_):        return nil
        }
    }
    
    var dur: Duration? {
        switch self {
            case .N(let note): return note.dur
            case .R(let rest): return rest.dur
        }
    }
}

