class MinimumNumberOfStepsToMakeTwoStringsAnagram {
    func minSteps(_ s: String, _ t: String) -> Int {
        var map: [Character: Int] = [:]
        var result = 0
        for c in s {
            map[c, default: 0] += 1
        }
        for c in t {
            guard let count = map[c] else { result += 1; continue }
            if count == 1 {
                map[c] = nil
            } else {
                map[c] = count - 1
            }
        }
        return result
    }
    
    func tests() {
        print(minSteps("bab", "aba")) // 1
        print(minSteps("leetcode", "practice")) // 5
        print(minSteps("anagram", "mangaar")) // 0
    }
}

