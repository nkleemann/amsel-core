/**
 The concept of behavior mimics
 part of the intentions of the Composer.
 */
struct Behavior {
    
    /// Probabilty to decide on playing a note or a rest
    /// First value represents note, second rest choice
    var noteOrRestProbabiltySeq: [Probability]
    
    /// The length of every note the player is currently playing
    var favoredNoteLength: Duration = .Quarter


    /// Basic initialization with median values
    init() {
        self.noteOrRestProbabiltySeq = [0.5, 0.5]
        self.favoredNoteLength = .Quarter
    }
}
