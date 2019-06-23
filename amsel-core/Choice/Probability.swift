/**
 Probabilities
 used on choosing notes, rests and
 MelodyEvents.
 
 Probabilities are represented as a sequence of
 probability values.
 
 The position of those values in the sequence is
 crucial, see following example:
 
        Note Values:   [ C,   D,   E,  ]
        Probabilities: [ 0.1, 0.2, 0.7 ]
 
 C is going to be chosen with 10%, D with 20%
 and E with 70% chance.
 */
struct Probability {
    /// Probabilies for choosing a specific note
    var noteProbs: [Double]
    /// Probabilies for choosing a specific rest
    var restProbs: [Double]
    /// Probabilities for choosing a note or a rest
    var evntProbs: [Double]
    
    /// Init with even distributions
    init(notePool: NoteChoicePool, restPool: RestChoicePool) {
        let notePoolLength: Int = notePool.notes.count
        let restPoolLength: Int = restPool.rests.count
        
        let medianNoteProb: Double = 1.0 / Double(notePoolLength)
        let medianRestProb: Double = 1.0 / Double(restPoolLength)
        
        self.noteProbs = Array(repeatElement(medianNoteProb, count: notePoolLength))
        self.restProbs = Array(repeatElement(medianRestProb, count: restPoolLength))
        self.evntProbs = [0.5, 0.5]
    }
}
