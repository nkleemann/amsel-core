/**
 A pool of Notes the active
 player can choose from.
 */
struct NoteChoicePool {
    /// Can't be immutable since we need to set duration later
    var notes: [Note]
    
    init(root: Note, scale: Scale) {
        self.notes = genScalePattern(from: root, scale: scale)
    }
}
