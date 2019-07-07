/**
 The concept of behavior mimics
 part of the intentions of the Composer.
 */
struct Behavior {
    
    /// Probabilty to decide on playing a note or a rest
    /// First value represents note, second rest choice
    var poolChoiceProbabillitySequence: [Probability]
    
    /// The note length the player will choose
    var favoredNoteLength: Duration
    
    /**
     Initialize a behavior for a player.
     
     - Parameters:
        - poolChoiceProbs: The probabillity sequence to decide on choosing to
                           play a note or a rest
        - favNoteLen:      Which note Length to prefer when playing
     */
    init(poolChoiceProbs: [Probability], favNoteLen: Duration) {
        self.poolChoiceProbabillitySequence = poolChoiceProbs
        self.favoredNoteLength = favNoteLen
    }
}
