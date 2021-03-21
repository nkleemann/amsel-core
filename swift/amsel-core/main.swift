/**

    Quick demo & test of amsel. 

**/

import WebMIDIKit


func playSporadicMelody(output: MIDIOutput?) -> Void {
    
    // Make a sheet
    let aMinPent = Part(root: Note(69), scale: scales["pentatonic-minor"]!, length: 16)
    let dMinPent = Part(root: Note(62), scale: scales["pentatonic-minor"]!, length: 16)
    let cMajPent = Part(root: Note(60), scale: scales["pentatonic-major"]!, length: 16)
    let fMajPent = Part(root: Note(53), scale: scales["pentatonic-major"]!, length: 16)
    let sheetMelo  = Sheet(parts: [aMinPent, dMinPent, cMajPent, fMajPent])
    
    // Give it to the player
    var player = Player(sheet: sheetMelo)
    
    // Instruct the player
    player.behavior.favoredNoteLength       = .ThirtySecond
    player.behavior.noteOrRestProbabiltySeq = [0.4, 0.6]
    let allowedRests: [Duration]            = [.Half, .Quarter, .Sixteenth, .ThirtySecond, .SixtyForth]
    let allowedRestsProbs: [Probability]    = [0.4,    0.2,      0.0,        0.3,           0.1]
    
    // Generate the melody
    let melody = player.generateMelodyFromSheet(allowedRest: allowedRests, restProbs: allowedRestsProbs)
    
    // Play the melody
    for event in melody.events {
        // sed(melodyEvent: event, sendTo: output, tempo: 40)
        sendWithRandomVelocity(melodyEvent: event, sendTo: output, tempo: 80)
    }
}

func playFlutyMelody(output: MIDIOutput?) -> Void {
    
    // Make a sheet
    let aMinPent = Part(root: Note(69), scale: scales["pentatonic-minor"]!, length: 16)
    let dMinPent = Part(root: Note(62), scale: scales["pentatonic-minor"]!, length: 16)
    let cMajPent = Part(root: Note(60), scale: scales["pentatonic-major"]!, length: 16)
    let fMajPent = Part(root: Note(53), scale: scales["pentatonic-major"]!, length: 16)
    let sheetMelo  = Sheet(parts: [aMinPent, dMinPent, cMajPent, fMajPent])
    
    // Give it to the player
    var player = Player(sheet: sheetMelo)
    
    // Instruct the player
    player.behavior.favoredNoteLength       = .Eighth
    player.behavior.noteOrRestProbabiltySeq = [0.5, 0.5]
    
    let allowedRests: [Duration]            = [.Eighth, .Quarter]
    let allowedRestsProbs: [Probability]    = [0.7,     0.3     ]
    
    // Generate the melody
    let melody = player.generateMelodyFromSheet(allowedRest: allowedRests, restProbs: allowedRestsProbs)
    
    // Play the melody
    for event in melody.events {
        // sed(melodyEvent: event, sendTo: output, tempo: 40)
        sendWithRandomVelocity(melodyEvent: event, sendTo: output, tempo: 60)
    }
}


///
///     MAIN
///

fileprivate let midi   = MIDIAccess()
fileprivate let input  = midi.inputs.prompt()
fileprivate let output = input.flatMap { midi.output(for: $0) }

playSporadicMelody(output: output)
