class BuddyStrings {
    
    enum Diff {
        case none
        case first(f1: Character, f2: Character)
        case second
    }
    
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else { return false }
        var chars = Array(repeating: 0, count: 26)
        var diff = Diff.none
        for (c1, c2) in zip(s, goal) {
            chars[Int(c1.asciiValue! - Character("a").asciiValue!)] += 1
            guard c1 != c2 else { continue }
            switch diff {
            case .none:
                diff = .first(f1: c1, f2: c2)
            case .first(f1: let f1, f2: let f2):
                guard f1 == c2 && f2 == c1 else { return false }
                diff = .second
            case .second:
                return false
            }
        }
        switch diff {
        case .none:
            for charCount in chars {
                if charCount > 1 { return true }
            }
        case .first:
            return false
        case .second:
            return true
        }
        return false
    }
    
    func tests() {
        print(buddyStrings("ab", "ba")) // true
        print(buddyStrings("ab", "ab")) // false
        print(buddyStrings("aa", "aa")) // true
    }
}

