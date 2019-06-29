/**
 Playing a Melody by sending
 it's MelodyEvents to a open MIDI Port.
 
 Since WebMIDIKit lacks timing, rhythm and sequencing capabilities
 I have to figure out a workaround to emulate this for the Demo.
 
 On the long term I want to add correct musical sequencing to Amsel.
 */

import WebMIDIKit

/**
 Send a sequence of MelodyEvents to a MIDI Port while converting
 these events to MIDI messages.
 */
func send(melody: Melody, to output: MIDIOutput?) -> Void {
    
    /// An example Melody could look like this:
    /// [Note(60, .Quarter), .Whole, Note(62, .Eight)]
    ///
    /// Then, the resulting calls of output.send should look like this:
    ///
    /// output.send([NoteOn,  0x3C, vel])
    ///       .send([NoteOff, 0x3C, vel], offset: toMilliSeconds(.Quarter))
    ///
    /// usleep(toMicroSeconds(.Whole))
    ///
    /// output.send([NoteOn,  0x3E, vel])
    ///       .send([NoteOff, 0x3E, vel], offset: toMilliSeconds(.Eight))

    // TODO implement this
    // TODO figure out a workaround for the lack of timing and rhythm abstractions in WebMIDIKit
}
