/**
 * Generate a sequence of scale degrees based on 
 * a root note and a scale.
 */

 inlets = 1;
 outlets = 1;

function genScale(rootMIDINum, scaleName) {
    var currentNote  = rootMIDINum;
    var scalePattern = lookupScale(scaleName);
    var result       = [currentNote];
        
    for (var i = 0; i < scalePattern.length; i++) {
        var nextNote = currentNote + scalePattern[i];
        result.push(nextNote);
        currentNote = nextNote;
    }

    outlet(0, result);
}

///
///     NOTE/SCALE LOOKUP 
///

function lookupScale(scaleName) {

    var scales = {
        "major":
            [2, 2, 1, 2, 2, 2, 1],
        
        "minor":
            [2, 1, 2, 2, 1, 2, 2],
        
        "harmonic-minor":
            [2, 1, 2, 2, 1, 3, 1],
        
        "melodic-minor":
            [2, 1, 2, 2, 2, 2, 1],
        
        "romanian-minor":
            [2, 1, 3, 1, 2, 1, 2],
            
        // Named after the Dorian Greeks.
        "dorian-mode":
            [2, 1, 2, 2, 2, 1, 2],
        
        // Ancient Greek Scale attributed to Sappho, the 7th-century-B.C. poet and musician.
        "mixolydian-mode":
            [2, 2, 1, 2, 2, 1, 2],
        
        // Named after the anciant kingdom of Phrygia in Anatolia.
        "phrygian-mode":
            [1, 2, 2, 2, 1, 2, 2],
        
        // Named after the anciant kingdom of Lydia in Anatolia.
        "lydian-mode":
            [2, 2, 2, 1, 2, 2, 1],
        
        // Locrian is the word used to describe the inhabitants of the ancient Greek regions of Locris.
        "locrian-mode":
            [1, 2, 2, 1, 2, 2, 2],
        
        // Based on the 'Mystic Chord'
        "prometheus":
            [2, 2, 2, 3, 1, 2],
        
        "spanish-gypsy":
            [1, 3, 1, 2, 1, 2, 2],
        
        "blues":
            [3, 2, 1, 1, 3, 2],
        
        "super-locrian":
            [1, 2, 1, 2, 2, 2, 2],
        
        // Still in minor, despite it's name
        "neopolitan-major":
            [1, 2, 2, 2, 2, 2, 1],
        
        "neopolitan-minor":
            [1, 2, 2, 2, 1, 2, 2],
        
        // originally published in a Milan journal as a musical challenge,
        // with an invitation to harmonize it in some way.
        "enigmatic":
            [1, 3, 2, 2, 2, 1, 1],
        
        "pentatonic-neutral":
            [2, 3, 2, 3],
        
        "pentatonic-major":
            [2, 3, 2, 2, 3],
        
        "pentatonic-minor":
            [3, 2, 2, 3, 2],
        
        "pentatonic-blues":
            [3, 2, 1, 1, 3]
    }

    var scalePattern = scales[scaleName];

    if (scalePattern != undefined) {
        return scalePattern
    } else {
        return [0];
    }
}
