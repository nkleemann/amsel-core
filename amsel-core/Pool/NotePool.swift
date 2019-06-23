/**
 A pool of Notes the active
 player can choose from.
 */
struct NoteChoicePool {
    let notes: [Note]
    
    init(root: Note, scale: Scale) {
        self.notes = genScalePattern(from: root, scale: scale)
    }

}
