/// Entry point used for SIMPLE testing of 'core'

import Foundation

print("Core running\n")

// Simple transposition
let c5: Note = Note(60)
let d5: Note = Note(62)
let t1: Bool = transpose(note: c5, step: .Whole, dir: .Up) == d5
print("Transposition working: \(t1)\n")

/// Simple Scale Pattern generation
let c5Major: ScalePattern         = genScalePattern(from: c5, scale: scales["major"]!)
let c5MajorExpected: ScalePattern = [60, 62, 64, 65, 67, 69, 71, 72].map{Note($0)}
let t2: Bool                      = c5Major == c5MajorExpected
print("ScalePattern generation working (major): \(t2)\n")

let aSharp5Blues: ScalePattern         = genScalePattern(from: Note(70), scale: scales["blues"]!)
let aSharp5BluesExpected: ScalePattern = [70, 73, 75, 76, 77, 80, 82].map{Note($0)}
let t3: Bool                           = aSharp5Blues == aSharp5BluesExpected
print("ScalePattern generation working (blues): \(t3)\n")


/// MelodyEvent Tests
let melody: [MelodyEvent] = [.N(Note(60, .Quarter)), .R(.Half)]
print(melody.map{x in x.val}, "\n")

/// Octave transposition
print(octave(Note(60), .Up), "\n")

/// TEST POOLS

/// Build a NoteChoicePool
let ncp = NoteChoicePool(root: Note(60), scale: scales["major"]!) // [C5, D5, E5, F5, G5, A5, H5, C6]
print("Pool elements: \(ncp.elements.map{$0.val})")
print("Pool probs: \(ncp.probabilitySeq)")
print("Note pool is valid: \(ncp.isValid())", "\n")

/// Edge case 1 -> Empty prob array, should be ignored
let oldProbs = ncp.probabilitySeq
ncp.adjustProbabilities(probs: [])
print("Empty prob array edge case ignored: \(oldProbs == ncp.probabilitySeq)")
/// Edge case 2 -> Prob array too big
ncp.adjustProbabilities(probs: [0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
print("Too big prob array edge case ignored: \(oldProbs == ncp.probabilitySeq)")
/// Edge case 3 -> Prob array too small
ncp.adjustProbabilities(probs: [1.0, 0.0])
print("Too small prob array edge case ignored: \(oldProbs == ncp.probabilitySeq)")
/// Edge case 4 -> sum(probs) != 1.0
ncp.adjustProbabilities(probs: [1.0, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
print("sum(probs) != 1.0 edge case ignored: \(oldProbs == ncp.probabilitySeq)", "\n")

/// Build a RestChoicePool
let rcp = RestChoicePool()


/// TEST PLAYER
let p = Player()

/// TEST PLAYING MELODY
print("Play a melody in C-major:")
for _ in 0...10 {
    let melodyEvent = p.play(notePool: ncp, restPool: rcp)
    print(melodyEvent)
}


///// TEST WEBMIDIKIT
//import WebMIDIKit
//
//let midi = MIDIAccess()
//
//let noteOn: [UInt8] = [0x90, 0x40, 0x7f]
//let noteOff: [UInt8] = [0x80, 0x40, 0]
//
///// List output ports
//let input = midi.inputs.prompt()
//let output = input.flatMap { midi.output(for: $0) }
//
//input?.onMIDIMessage = { packet in
//    print("received \(packet)")
//}
//
///// send a second long C8 to the port
//output?.send(noteOn)
//       .send(noteOff, offset: 1000)
///// we have to sleep because otherwise the program would exit before all
///// midi notes were played
//sleep(1)

