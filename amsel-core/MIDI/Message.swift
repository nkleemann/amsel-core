/**
 MIDI messages are the atoms
 of the MIDI protocol.
 
 The two most important message
 types are: **NOTE ON** and **NOTE OFF**.
 
    A NOTE ON Message is structured as follows:
 
     Status byte : 1001 CCCC
     Data byte 1 : 0PPP PPPP
     Data byte 2 : 0VVV VVVV
 
    Where:
 
     "CCCC" is the MIDI channel (from 0 to 15)
     "PPP PPPP" is the pitch value (from 0 to 127, middle C := 60)
 
    The NOTE OFF message is structured as follows:
 
     Status byte : 1000 CCCC
     Data byte 1 : 0PPP PPPP
     Data byte 2 : 0VVV VVVV
 
    where CCCC and PPPPPPP have the same meaning as above.
    The VVVVVVV is the release velocity, which is very rarely used. By default, set it to zero.
 
 (http://www.music-software-development.com/midi-tutorial.html)
*/
enum MidiMessageType: UInt8 {
    case NoteOn  = 0x90,
         NoteOff = 0x80
}

/**
 A MIDI message is the atom of the
 MIDI protocol.
 */
struct MIDIMessage {
    let type: MidiMessageType
    let note: UInt8
    let velocity: UInt8
    
    /// Init a MIDI message of a given type with two data bytes
    init(type: MidiMessageType, noteVal: UInt8, velocity: UInt8) {
        self.type = type
        self.note = noteVal
        self.velocity = velocity
    }
    
    /**
     Convert a MIDI message object to a MIDI message packet.
     
     A MIDI message packet is sequence of the status and
     the two data bytes.
     */
    func toPacket() -> [UInt8] {
        return [self.type.rawValue, self.note, self.velocity]
    }
    
    /**
     Convert a MIDI On message to a MIDI Off message.
     */
    func toMIDIOffMsg() -> MIDIMessage {
        return MIDIMessage(type: .NoteOff, noteVal: self.note, velocity: self.velocity)
    }
}
