/**
 Probabilities are
 used on choosing notes, rests and
 MelodyEvents.
 
 Probabilities are represented as a sequence of
 probability values.
 
 The position of those values in the sequence is
 crucial, see following example:
 
        Note Values:   [ C,   D,   E,  ]
        Probabilities: [ 0.1, 0.2, 0.7 ]
 
 C is going to be chosen with 10%, D with 20%
 and E with 70% chance.
 */
typealias Probability = Double

/**
 Check if a given probability sequence is valid for a given pool.
 
 - parameters:
    - for pool: The pool the sequence should be tested on
    - seq: The sequence to be tested for validity
 
 A probabilty sequence is valid only if
 - It is not empty
 - It has the same number of elements as pool.elements
 - The sum of all it's probability values is 1.0
 */
func probabillitySeqIsValid<E>(for pool: Pool<E>, seq: [Probability]) -> Bool {
    return
        (!seq.isEmpty)                      &&
        (pool.elements.count == seq.count)  &&
        (seq.reduce(0.0, +) == 1.0)
}
