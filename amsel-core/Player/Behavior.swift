/**
 The concept of behavior mimics
 part of the intentions of the Composer.
 */
struct Behavior {
    
    /// Probabilty to decide on playing a note or a rest
    /// First value represents note, second rest choice
    var noteOrRestProbabiltySeq: [Probability]
    var playingPace: Pace

    /// How quickly notes and rests will vary
    enum Pace {
        case Calm,
             Average,
             Hectic
    }
    
    /// Basic initialization with median values
    init() {
        self.noteOrRestProbabiltySeq = [0.5, 0.5]
        self.playingPace = .Average
    }
}
