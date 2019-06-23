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
