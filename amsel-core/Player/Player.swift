/**
 The Player is responsible for
 choosing which notes and rests
 to play and is influenced by
 various parameters (noise / external data).
*/
struct Player {
    
    /// How rapidly notes and rests will vary
    enum Behavior: Equatable {
        case Calm,
             Average,
             Hectic
    }
    
    
//    func play(notePool: NoteChoicePool, restPool: RestChoicePool, probs: Probability) -> MelodyEvent {
//        /// First choose to play rest or note
//        switch (Noise.skewedRandInt(probabilities: probs.evntProbs))
//
//    }
    
    
    // func chooseNote(noteProbs: Probability)

}
