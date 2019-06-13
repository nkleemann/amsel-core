/*
 Musical definitions of scales,
 ie - sequences of steps to perform on a note.
 
 It also contains types needed to express the
 concept of a 'scale' in relation to a note.
 */

/// A scale is defined by a sequence of steps
typealias Scale = [Step]

/// A step up or down from a note
enum Step: Int {
    case Half = 1,
         Whole,
         AugSec
}

/// Perform the step upwards or downwards
enum Direction: Int {
    case Up   = 1,
         Down = -1
}

let scales = [
    "major":
        [Step.Whole, Step.Whole, Step.Half, Step.Whole, Step.Whole, Step.Whole, Step.Half],
    
    "minor":
        [Step.Whole, Step.Half, Step.Whole, Step.Whole, Step.Half, Step.Whole, Step.Whole],
    
    "harmonic-minor":
        [Step.Whole, Step.Half, Step.Whole, Step.Whole, Step.Half, Step.AugSec, Step.Half],
    
    "melodic-minor":
        [Step.Whole, Step.Half, Step.Whole, Step.Whole, Step.Whole, Step.Whole, Step.Half],
    
    "romanian-minor":
        [Step.Whole, Step.Half, Step.AugSec, Step.Half, Step.Whole, Step.Half, Step.Whole],
        
    // Named after the Dorian Greeks.
    "dorian-mode":
        [Step.Whole, Step.Half, Step.Whole, Step.Whole, Step.Whole, Step.Half, Step.Whole],
    
    // Ancient Greek Scale attributed to Sappho, the 7th-century-B.C. poet and musician.
    "mixolydian-mode":
        [Step.Whole, Step.Whole, Step.Half, Step.Whole, Step.Whole, Step.Half, Step.Whole],
    
    // Named after the anciant kingdom of Phrygia in Anatolia.
    "phrygian-mode":
        [Step.Half, Step.Whole, Step.Whole, Step.Whole, Step.Half, Step.Whole, Step.Whole],
    
    // Named after the anciant kingdom of Lydia in Anatolia.
    "lydian-mode":
        [Step.Whole, Step.Whole, Step.Whole, Step.Half, Step.Whole, Step.Whole, Step.Half],
    
    // Locrian is the word used to describe the inhabitants of the ancient Greek regions of Locris.
    "locrian-mode":
        [Step.Half, Step.Whole, Step.Whole, Step.Half, Step.Whole, Step.Whole, Step.Whole],
    
    // Based on the 'Mystic Chord'
    "prometheus":
        [Step.Whole, Step.Whole, Step.Whole, Step.AugSec, Step.Half, Step.Whole],
    
    "spanish-gypsy":
        [Step.Half, Step.AugSec, Step.Half, Step.Whole, Step.Half, Step.Whole, Step.Whole],
    
    "blues":
        [Step.AugSec, Step.Whole, Step.Half, Step.Half, Step.AugSec, Step.Whole],
    
    "super-locrian":
        [Step.Half, Step.Whole, Step.Half, Step.Whole, Step.Whole, Step.Whole, Step.Whole],
    
    // Still in minor, despite it's name
    "neopolitan-major":
        [Step.Half, Step.Whole, Step.Whole, Step.Whole, Step.Whole, Step.Whole, Step.Half],
    
    "neopolitan-minor":
        [Step.Half, Step.Whole, Step.Whole, Step.Whole, Step.Half, Step.Whole, Step.Whole],
    
    // originally published in a Milan journal as a musical challenge,
    // with an invitation to harmonize it in some way.
    "enigmatic":
        [Step.Half, Step.AugSec, Step.Whole, Step.Whole, Step.Whole, Step.Half, Step.Half],
    
    "pentatonic-neutral":
        [Step.Whole, Step.AugSec, Step.Whole, Step.AugSec],
    
    "pentatonic-major":
        [Step.Whole, Step.AugSec, Step.Whole, Step.Whole, Step.AugSec],
    
    "pentatonic-minor":
        [Step.AugSec, Step.Whole, Step.Whole, Step.AugSec, Step.Whole],
    
    "pentatonic-blues":
        [Step.AugSec, Step.Whole, Step.Half, Step.Half, Step.AugSec]
]
