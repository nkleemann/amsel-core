/**
 A Pool is a collection of elements
 of type: E where each element can be chosen
 by a certian probability.
 */
class Pool<E> {
    let elements: [E]
    let probabilities: [Probability]
    
    /// Init with even probability distribution
    init(elems: [E]) {
        self.elements = elems
        
        // Evenly distribute the same probability
        let poolSize: Int = self.elements.count
        let medianProb: Double = 1 / Double(poolSize)
        self.probabilities = Array(repeatElement(medianProb, count: poolSize))
    }
}
