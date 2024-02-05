class FirstUniqueCharacterInAString {
    func firstUniqChar(_ s: String) -> Int {
        var candidates: [Character: Int] = [:]
        for (i, c) in s.enumerated() {
            candidates[c] = (candidates[c] == nil) ? i : -1
        }
        var result = Int.max
        for i in candidates.values where i != -1 {
            result = min(result, i)
        }
        return result == Int.max ? -1 : result
    }

    func firstUniqChar2(_ s: String) -> Int {
        var dict: [Character: Int] = [:] // char: index
        var candidates: [Character] = []
        for (i, c) in s.enumerated() {
            if dict[c] != nil {
                if let index = candidates.firstIndex(of: c) {
                    candidates.remove(at: index)
                }
            } else {
                dict[c] = i
                candidates.append(c)
            }
        }
        if let first = candidates.first {
            return dict[first]!
        }
        return -1
    }

    func tests() {
        print(firstUniqChar("leetcode")) // 0
        print(firstUniqChar("loveleetcode")) // 2
        print(firstUniqChar("aabb")) // -1
    }
}
