class RotateString {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else { return false }
        return (s + s).contains(goal)
    }
    
    func tests() {
        print(rotateString("abcde", "cdeab")) // true
        print(rotateString("abcde", "abced")) // false
    }
}

