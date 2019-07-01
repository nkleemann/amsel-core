/**
 Playing a Melody by sending
 it's MelodyEvents to an open MIDI Port.
 
 MIDI Sync currently is not supported due to lack
 of implementation in WebMIDIKit.
 */

import WebMIDIKit
import Foundation

/**
 Play a MelodyEvent by converting it to a series of MIDI messages and sending it to
 an open MIDI output port. Also produce rhythm by halting the execution for the
 correct amount of microseconds.
 
    An example sequences of MelodyEvents picked by the Player could look like this:
 
     [Note(60, .Quarter), .Whole, Note(62, .Eight)]
 
    Then, the resulting calls of output.send should look like this:
 
     output.send([NoteOn,  0x3C, vel])
     .send([NoteOff, 0x3C, vel], offset: toMilliSeconds(.Quarter))
 
     usleep(toMicroSeconds(.Whole))
 
     output.send([NoteOn,  0x3E, vel])
     .send([NoteOff, 0x3E, vel], offset: toMilliSeconds(.Eight))
 
 - Parameters:
     - melodyEvent: A note or rest to be played
     - output:      The output MIDI port
     - tempo:       The song tempo used for calculating the right halting times
 */
func play(melodyEvent: MelodyEvent, sendTo output: MIDIOutput?, tempo: BPM) -> Void {
    
    guard let midiOutput = output else {
        print("[*] from 'send': MIDI Port closed")
        return
    }

    switch melodyEvent {
        
        /// Play a note
        case .N(let note):
            
            let midiOnMsg  = MIDIMessage(type: .NoteOn, noteVal: UInt8(note.val), velocity: 0x7F)
            let midiOffMsg = midiOnMsg.toMIDIOffMsg()
            
            let durationInMicroseconds = note.dur.toMircoSeconds(songTempo: tempo)
            
            // WebMIDIKit API wants offset given in milliseconds and as Double
            let offsetInMilliseconds = Double(durationInMicroseconds) * 0.001
            
            midiOutput.send(midiOnMsg.toPacket())
            midiOutput.send(midiOffMsg.toPacket(), offset: offsetInMilliseconds)
            
            // Wait for the duration of the note until we can play the next note
            usleep(useconds_t(durationInMicroseconds))
            break
        
        /// Play a rest
        case .R(let dur):
            usleep(useconds_t(dur.toMircoSeconds(songTempo: tempo)))
            break
    }
}

/**
 Send a sequence of MelodyEvents to a MIDI Port while converting
 these events to MIDI messages.
 */
func play(melody: Melody, to output: MIDIOutput?) -> Void {
    // TODO Decide on keeping this (Option to hold melodies in memory)
}
