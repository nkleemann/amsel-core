/**
 Data and functions related to
 the 'Player' namespace of Amsel.
 
 This namespace is responsible for
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
    
    
    func choose(notePool: NoteChoicePool, restPool: RestChoicePool) -> MelodyEvent {
        /// TODO: Choose Note / Rest and emit as MelodyEvent
    }
    
    /// Don't allow initialization since this is a namespace
    private init() {}
}
