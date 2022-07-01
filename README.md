# amsel-core

A **tool** for generative composition producing monophonic phrases, organized into parts and influenced by probability sequences. **"Tool"** is stressed here because its aim is to be playable in a live context.

Originally written in Swift & currently being ported to Max as an abstraction.

## Original Doc (Swift)

Configure via `.compose` files or related messages to give a basic musical frame:

```
loop, cycles: 8
    A  major, bars: 4
    E  minor, bars: 2
    F  minor, bars: 2
    G# major, bars: 4
end
```

Instruct the `Player` object to emit a stream of MIDI events. The `Player` object holds two probability sequences which can be altered in real time to influence which musical event (note, accent, rest) will be played next.

Example configration:

```swift
func playFlutyMelody(output: MIDIOutput?) -> Void {
    
    // Make a sheet
    let aMinPent = Part(root: Note(69), scale: scales["pent-min"]!, length: 16)
    let dMinPent = Part(root: Note(62), scale: scales["pent-min"]!, length: 16)
    let cMajPent = Part(root: Note(60), scale: scales["pent-maj"]!, length: 16)
    let fMajPent = Part(root: Note(53), scale: scales["pent-maj"]!, length: 16)
    let sheetMelo  = Sheet(parts: [aMinPent, dMinPent, cMajPent, fMajPent])
    
    // Give it to the player
    var player = Player(sheet: sheetMelo)
    
    // Instruct the player
    player.behavior.favoredNoteLength       = .Eighth
    player.behavior.noteOrRestProbabiltySeq = [0.5, 0.5]
    
    let allowedRests: [Duration]            = [.Eighth, .Quarter]
    let allowedRestsProbs: [Probability]    = [0.7,     0.3     ]
    
    // Generate the melody
    let melody = player.generateMelodyFromSheet(allowedRest: allowedRests, 
                                                restProbs: allowedRestsProbs)
    
    // Play the melody
    for event in melody.events {
        sendWithRandomVelocity(melodyEvent: event, sendTo: output, tempo: 60)
    }
}
```

<p align="center">
<img src="https://github.com/nkleemann/amsel-core/blob/master/doc/schematic.png" width="90%" height="80%"/>
</p>
