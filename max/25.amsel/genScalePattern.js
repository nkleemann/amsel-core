/**
 
 Generate a concrete scale starting at a root note.

    func genScalePattern(from root: Note, scale: Scale) -> ScalePattern {
        var currentNote: Note    = root
        var result: ScalePattern = [currentNote]
        
        for step in scale {
            let nextNote = transpose(note: currentNote, step: step, dir: .Up)
            result.append(nextNote)
            currentNote = nextNote
        }
        return result
    }
 */

    