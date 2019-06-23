/**
 Namespace for skewed
 random number generators
 used to mimic the 'choice'
 of the 'player'.
 
 The Skewing is an integral
 part to allow some sort of
 control and intent to take
 place in the generation of melodies.
*/


struct Noise {
    
    /**
     Generate a skewed random number in range: (0, probabilities.count)
     where 'probabilities' is an enumartion of p-values from 0.0 (impossible)
     to 1.0 (always chosen). Their position in the sequence corresponds with
     the value they give the probability for.
     (Thanks to: stackoverflow.com/users/1187415/martin-r)
     
         probabilities = [0.2, 0.8]
         // -> 0 has a 20%,
         // 1 a 80% chance of
         // getting picked.
     
     - parameters:
        - probabilities: Enumaration of probability values.
     
     - returns: A skewed random integer value.
    */
    static func skewedRandInt(probabilities: [Double]) -> Int {
        // Sum of all probabilities (so that we don't have to require that the sum is 1.0):
        let sum = probabilities.reduce(0, +)
        // Random number in the range 0.0 <= rnd < sum :
        let rnd = Double.random(in: 0.0 ..< sum)
        // Find the first interval of accumulated probabilities into which `rnd` falls:
        var accum = 0.0
        for (i, p) in probabilities.enumerated() {
            accum += p
            if rnd < accum {
                return i
            }
        }
        // This point might be reached due to floating point inaccuracies,
        // in that case give back rnd
        return Int(rnd)
    }
    
    /// Don't allow initialization since this is a namespace
    private init() {}
}

