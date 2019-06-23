/**
 A pool of Notes the active
 player can choose from.
 */
class NoteChoicePool: Pool<Note> {
    
    /// Init with even probability distribution
    init(root: Note, scale: Scale) {
        super.init(elems: genScalePattern(from: root, scale: scale))
    }
}
