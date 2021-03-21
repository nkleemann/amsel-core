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
 
 Every note has a duration ONLY when it
 is present in the context of a sequence
 or melody.
*/
struct Note: Equatable {
    
    let val: SemiTone
    var dur: Duration
    
    var octave: Int {
        return val / 12
    }
    
    /// Construct a note, default duration is .Quarter
    init(_ val: SemiTone) {
        self.val = val
        self.dur = .Quarter
    }
    
    /// Construct a note with timing information
    init(_ val: SemiTone, _ dur: Duration) {
        self.val = val
        self.dur = dur
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
    return Note(note.val + shift)
}

/**
 Generate a concrete scale starting at a root note.
 
 - parameters:
     - root:  The root note
     - scale: The scale to be generated

 This is a non-recursive, concrete implementation of 'scanl' from Haskell.
*/
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

/**
 Transpose a note an octave down or up.
 
 - parameters:
     - from: The note to be transposed
     - dir: The direction of the transposition
 */
func octave(_ from: Note, _ dir: Direction) -> Note {
    return Note(from.val + (12 * dir.rawValue))
}
