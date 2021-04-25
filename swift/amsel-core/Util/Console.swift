/**
 Everything related to the
 console amsle-demo is running in.
 */

extension MelodyEvent {
    func info() -> String {
        guard let val = self.val else {
            return "Rest: \(self.dur)"
        }
        return "Note: \(val) \(self.dur)"
    }
}
