/**
 The Player is responsible for
 choosing which notes and rests
 to play and is influenced by
 various parameters (noise / external data).
*/
struct Player {
    
    /// Mimic intention of the User (Composer)
    var behavior: Behavior
    
    /**
     Pick a note or rest and convert it to a MelodyEvent.
     
     - Parameters:
        - notePool: The Pool of notes to choose from
        - restPool: The pool of rests to choose from
     */
    func pick(notePool: NoteChoicePool, restPool: RestChoicePool) -> MelodyEvent {
        // Play a note or play a rest?
        let choice: PoolType = choosePool()
        
        switch (choice) {
            // Play a note
            case .NotePool:
                /// TODO Decide on note duration (probs)
                let note = notePool.pick()
                return .N(note)
            // "Play" a rest
            default:
                return .R(restPool.pick())
        }
    }
    
    /**
     Make a choice between a NotePool or a RestPool to decide whether to
     play a note or a rest.
     
     The choice is based on the Behavior of the player.
     */
    func choosePool() -> PoolType {
        let choiceIndex = Noise.skewedRandInt(probs: self.behavior.poolChoiceProbabillitySequence)
        switch (choiceIndex) {
        case 0:
            return .NotePool
        default:
            return .RestPool
        }
    }
    
    /**
     Compose a melody of a given length.
     
     - Parameters:
     - notePool: The Pool of notes to choose from
     - restPool: The pool of rests to choose from
     - melodyLength: How many MelodyEvents to generate
     */
    func compose(notePool: NoteChoicePool, restPool: RestChoicePool, melodyLength: Int) -> Melody {
        var events: [MelodyEvent] = []
        
        for _ in 1...melodyLength {
            events.append(self.pick(notePool: notePool, restPool: restPool))
        }
        
        return Melody(from: events)
    }
    
    /**
     Adjust the players behavior by changing the probability sequence
     for the choice between notes or rests.
     
     - Parameters:
        - probs: Probabilty sequence to decide on playing a note or a rest
     */
    mutating func adjustPoolChoiceBehavior(probs: [Probability]) {
        // TODO: Add validity check
        self.behavior.poolChoiceProbabillitySequence = probs
    }
    
    /// Initialize with median values
    init() {
        self.behavior = Behavior(poolChoiceProbs: [0.5, 0.5], favNoteLen: .Quarter)
    }
}
