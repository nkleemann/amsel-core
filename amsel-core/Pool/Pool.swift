/**
 A Pool is a collection of elements
 of type: E where each element can be chosen
 by a certian probability.
 */
class Pool<E> {
    let elements: [E]
    var probabilitySeq: [Probability]

    /**
     Pick an element from the pool. The probability sequence of the pool
     is going to influence which element has a higher or lower chance
     of getting picked.
     */
    func pick() -> E {
        let choiceIndex: Int = Noise.skewedRandInt(probs: self.probabilitySeq)
        // No need to check bounds here since bound checking is
        // already done in 'adjustProbabilities'.
        return elements[choiceIndex]
    }
    
    /**
     Set and change the probability sequence.
     Safety:
        - Avoid crashing by ignoring non matching probability arrays
     
     - parameters:
        - probs: The new probability sequence
     */
    func adjustProbabilities(probs: [Probability]) -> Void {
        /// PERFORMANCE?
        if (probabillitySeqIsValid(for: self, seq: probs)) {
            self.probabilitySeq = probs
        }
    }
    
    /// Init with even probability distribution
    init(elems: [E]) {
        self.elements = elems
        let poolSize: Int = elems.count
        let medianProb: Double = 1 / Double(poolSize)
        self.probabilitySeq = Array(repeatElement(medianProb, count: poolSize))
    }
        
    /**
     Check if the structure of the pool is valid.
     
      A pool is valid only if:
      - It's probability sequence if valid (see: Probability.swift)
      - It has elements
     */
    func isValid() -> Bool {
        return (!self.elements.isEmpty && probabillitySeqIsValid(for: self, seq: self.probabilitySeq))
    }
}
