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

let scales: [String : Scale] = [
    "major":
        [.Whole, .Whole, .Half, .Whole, .Whole, .Whole, .Half],
    
    "minor":
        [.Whole, .Half, .Whole, .Whole, .Half, .Whole, .Whole],
    
    "harmonic-minor":
        [.Whole, .Half, .Whole, .Whole, .Half, .AugSec, .Half],
    
    "melodic-minor":
        [.Whole, .Half, .Whole, .Whole, .Whole, .Whole, .Half],
    
    "romanian-minor":
        [.Whole, .Half, .AugSec, .Half, .Whole, .Half, .Whole],
        
    // Named after the Dorian Greeks.
    "dorian-mode":
        [.Whole, .Half, .Whole, .Whole, .Whole, .Half, .Whole],
    
    // Ancient Greek Scale attributed to Sappho, the 7th-century-B.C. poet and musician.
    "mixolydian-mode":
        [.Whole, .Whole, .Half, .Whole, .Whole, .Half, .Whole],
    
    // Named after the anciant kingdom of Phrygia in Anatolia.
    "phrygian-mode":
        [.Half, .Whole, .Whole, .Whole, .Half, .Whole, .Whole],
    
    // Named after the anciant kingdom of Lydia in Anatolia.
    "lydian-mode":
        [.Whole, .Whole, .Whole, .Half, .Whole, .Whole, .Half],
    
    // Locrian is the word used to describe the inhabitants of the ancient Greek regions of Locris.
    "locrian-mode":
        [.Half, .Whole, .Whole, .Half, .Whole, .Whole, .Whole],
    
    // Based on the 'Mystic Chord'
    "prometheus":
        [.Whole, .Whole, .Whole, .AugSec, .Half, .Whole],
    
    "spanish-gypsy":
        [.Half, .AugSec, .Half, .Whole, .Half, .Whole, .Whole],
    
    "blues":
        [.AugSec, .Whole, .Half, .Half, .AugSec, .Whole],
    
    "super-locrian":
        [.Half, .Whole, .Half, .Whole, .Whole, .Whole, .Whole],
    
    // Still in minor, despite it's name
    "neopolitan-major":
        [.Half, .Whole, .Whole, .Whole, .Whole, .Whole, .Half],
    
    "neopolitan-minor":
        [.Half, .Whole, .Whole, .Whole, .Half, .Whole, .Whole],
    
    // originally published in a Milan journal as a musical challenge,
    // with an invitation to harmonize it in some way.
    "enigmatic":
        [.Half, .AugSec, .Whole, .Whole, .Whole, .Half, .Half],
    
    "pentatonic-neutral":
        [.Whole, .AugSec, .Whole, .AugSec],
    
    "pentatonic-major":
        [.Whole, .AugSec, .Whole, .Whole, .AugSec],
    
    "pentatonic-minor":
        [.AugSec, .Whole, .Whole, .AugSec, .Whole],
    
    "pentatonic-blues":
        [.AugSec, .Whole, .Half, .Half, .AugSec]
]
