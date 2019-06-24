/**
 A Pool is a collection of elements
 of type: E where each element can be chosen
 by a certian probability.
 */
class Pool<E> {
    let elements: [E]
    var probabilities: [Probability]

    
    /**
     Pick an element from the pool. The probability sequence of the pool
     is going to influence which element has a higher or lower chance
     of getting picked.
     */
    func pick() -> E {
        let choiceIndex: Int = Noise.skewedRandInt(probs: self.probabilities)
        return elements[choiceIndex]
    }
    
    /**
     Set and change the probability sequence.
     Avoid Overflow by chopping of overrunning elements.
     
     - parameters:
        - probs: The new probability sequence
     */
    func adjustProbabilities(probs: [Probability]) -> Void {
        /// PERF?
        self.probabilities = Array(probs[0..<self.probabilities.count])
    }
    
    /// Init with even probability distribution
    init(elems: [E]) {
        self.elements = elems
        
        // Evenly distribute the same probability
        let poolSize: Int = self.elements.count
        let medianProb: Double = 1 / Double(poolSize)
        self.probabilities = Array(repeatElement(medianProb, count: poolSize))
    }
    
    /**
     Safety function to check if the structure of the pool is valid.
     the probabillity array and the element array have to be the same size
     and they can't be empty.
     */
    func isValid() -> Bool {
        return
            (!self.elements.isEmpty && !self.probabilities.isEmpty) &&
                (self.elements.count == self.probabilities.count)
    }
}
