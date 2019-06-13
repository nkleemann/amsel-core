/**
 A timed interval of silence.
*/

/// A musical rest is nothing but duration.
struct Rest {
    let dur: Duration
    
    init(_ dur: Duration) {
        self.dur = dur
    }
}
