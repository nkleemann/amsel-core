/*
 Musical definition of Notes and functions
 operating on them.
*/

/// An octave has 12 SemiTones
typealias SemiTone = Int
/// A concrete scale with rootnote at [0]
typealias ScalePattern = [Note]

/**
 A simple definition of a Note.
 
 Starting at 0 for C0
 (5 octaves below middle C)
 we can abstract over note values
 and their octaves as follows:
 
     0  -> C,      oct: 0
     1  -> CSharp, oct: 0
     2  -> D,      oct: 0
     3  -> DSharp, [...]
     4  -> E
     5  -> F
     6  -> FSharp
     7  -> G
     8  -> GSharp
     9  -> A
     10 -> ASharp
     11 -> B
     12 -> C,      oct: 1
     (...)
     69 -> A,      oct: 5
 
 For simplicity reasons flats are,
 for now, dismissed.
 
 Negative values are allowed aswell,
 they represent octaves lower than C0.
*/
struct Note: Equatable {
    
    var val: SemiTone
    
    var octave: Int {
        return val / 12
    }
}

/**
 Transpose a note up or downward a given amount of steps.
 
 - parameters:
     - note: The note to be transposed
     - step: The ammount of steps it will be transposed
     - dir:  Is the transposition performed upward or downward?
*/
func transpose(note: Note, step: Step, dir: Direction) -> Note {
    let shift: SemiTone = step.rawValue * dir.rawValue
    return Note(val: note.val + shift)
}

func genScalePattern(from note: Note, scale: Scale, dir: Direction) -> ScalePattern {
    var result: ScalePattern = []
    var currentNote: Note    = note
    
    result.append(currentNote)
    
    for step in scale {
        let nextNote: Note = transpose(note: currentNote, step: step, dir: dir)
        result.append(nextNote)
        currentNote = nextNote
    }
    
    return result
}
