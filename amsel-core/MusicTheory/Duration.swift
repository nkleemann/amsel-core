/**
 Data and functions related to
 intervals of time.
*/

/// An interval of time - length set in relation to a whole bar
enum Duration: Double, CaseIterable {
    case SixtyForth   = 0.015625,
         ThirtySecond = 0.03125,
         Sixteenth    = 0.0625,
         Eighth       = 0.125,
         Quarter      = 0.25,
         Half         = 0.5,
         Whole        = 1.0
}

