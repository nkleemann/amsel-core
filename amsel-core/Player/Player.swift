/**
 The Player is responsible for
 choosing which notes and rests
 to play and is influenced by
 various parameters (noise / external data).
*/
struct Player {
    
    /// A player needs a sheet to read
    let sheet: Sheet
    
//    /// The current notePool the player can play from
//    var currentNotePool: NoteChoicePool
//
//    /// The rests the player is allowed to choose
//    var currentRestPool: RestChoicePool
    
    /// The players behavior contains every probability
    /// sequence he/she needs for choosing pools, notes and rests.
    var behavior: Behavior
    
    
    /*
     Initilaize a player with a default
     behavior (all probabilites equal)
     and give him/her a sheet to read and play to.
     */
    init(sheet: Sheet) {
        self.behavior = Behavior()
        self.sheet = sheet
    }
    
    
    func generateMelodyFromSheet(allowedRest: [Duration], restProbs: [Probability]) -> Melody {
        var melodyEvents: [MelodyEvent] = []
        
        // For simplicity we use the same restpool for every part yet
        let restPool = RestChoicePool(elems: allowedRest, probs: restProbs)
        
        // For every part
        for part in sheet.parts {
            print("[*] Playing \(part.root) \(part.scale)")
            let partLengthInBars: Bars = part.length
            // Generate a note pool
            let notePool = NoteChoicePool(root: part.root, scale: part.scale)
            
            // Count the duration of every generated MelodyEvent to keep track of the part length
            var sumOfDurations: Double = 0.0
            
            while (true) {
                // Pick a note or rest
                let melodyEvent = pick(notePool: notePool, restPool: restPool)
                // Count in the length to stay in the bar
                sumOfDurations += melodyEvent.dur.rawValue
                
                // If the part is not finished
                if (sumOfDurations <= Double(partLengthInBars)) {
                    // Append the melody Event to the melody
                    melodyEvents.append(melodyEvent)
                } else {
                    // Be ready for the next part
                    sumOfDurations = 0
                    break
                }
            }
        }
        
        return Melody(from: melodyEvents)
    }
    
    
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
                var note = notePool.pick()
                note.dur = self.behavior.favoredNoteLength
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
        let choiceIndex = Noise.skewedRandInt(probs: self.behavior.noteOrRestProbabiltySeq)
        switch (choiceIndex) {
        case 0:
            return .NotePool
        default:
            return .RestPool
        }
    }
    
    /**
     Adjust the players behavior by changing the probability sequence
     for the choice between notes or rests.
     
     - Parameters:
        - probs: Probabilty sequence to decide on playing a note or a rest
     */
    mutating func adjustPoolChoiceBehavior(probs: [Probability]) {
        // TODO: Add validity check
        self.behavior.noteOrRestProbabiltySeq = probs
    }
    
    mutating func setFavoredNoteLength(_ noteLength: Duration) {
        self.behavior.favoredNoteLength = noteLength
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
    

}
