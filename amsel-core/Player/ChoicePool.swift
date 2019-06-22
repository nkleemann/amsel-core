/**
 A pool of Notes or Rests the active
 player can choose from.
 */

struct NoteChoicePool {
    let notes: ScalePattern
    
    init(root: Note, scale: Scale) {
        self.notes = genScalePattern(from: root, scale: scale)
    }
    
}

struct RestChoicePool {
    let rests: [Duration]
    
    init() {
        self.rests = Duration.allCases
    }
    
}
