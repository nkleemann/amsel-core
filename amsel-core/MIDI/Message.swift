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
enum MidiMessageType {
    case NoteOn,
         NoteOff
}
