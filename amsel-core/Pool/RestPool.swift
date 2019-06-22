/**
 A pool of Rests (pure duration) the active
 player can choose from.
 */

struct RestChoicePool {
    let rests: [Duration]
    
    init() {
        self.rests = Duration.allCases
    }
    
}
