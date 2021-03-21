/**
 A pool of Rests (pure duration) the active
 player can choose from.
 */
class RestChoicePool: Pool<Duration> {
    
    /// Init with even probability distribution
    init() {
        super.init(elems: Duration.allCases)
    }
    
    /// Init with specific elements and probabilities
    init(elems: [Duration], probs: [Probability]) {
        
        super.init(elems: elems)
        
        if probabillitySeqIsValid(for: self, seq: probs) {
            self.adjustProbabilities(probs: probs)
        }
    }
}
