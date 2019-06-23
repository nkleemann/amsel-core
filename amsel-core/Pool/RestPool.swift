/**
 A pool of Rests (pure duration) the active
 player can choose from.
 */
class RestChoicePool: Pool<Duration> {
    
    /// Init with even probability distribution
    init() {
        super.init(elems: Duration.allCases)
    }
}
