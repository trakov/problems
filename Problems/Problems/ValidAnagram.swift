class ValidAnagram {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        dictSolution(s, t)
    }

    func dictSolution(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var dict: [Character: Int] = [:]
        
        for c in s {
            dict[c, default: 0] += 1
        }
        
        for c in t {
            guard let val = dict[c] else {
                return false
            }
            if val == 1 {
                dict[c] = nil
            } else {
                dict[c] = val - 1
            }
        }
        
        return dict.count == 0
    }
    
    func sortedSolution(_ s: String, _ t: String) -> Bool {
        s.sorted() == t.sorted()
    }
    
    func tests() {
        print(isAnagram("anagram", "nagaram")) // true
        print(isAnagram("rat", "car")) // false
    }
}
