/**
 Namespace handling probabilities
 used on choosing notes, rests and
 MelodyEvents.
 */
struct Probability {
    /// Probabilies for choosing a specific note
    var noteProbs: [Double]
    /// Probabilies for choosing a specific rest
    var restProbs: [Double]
    /// Probabilities for choosing a note or a rest
    var evntProbs: [Double]
    
    
}
