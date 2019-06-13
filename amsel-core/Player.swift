/**
 Data and functions related to
 the actual generation of
 melodies - the "Generative" part
 of this "Generative System".
*/

/// How rapidly notes and rests will vary
enum Behavior: Equatable {
    case Calm,
    Average,
    Hectic
}
