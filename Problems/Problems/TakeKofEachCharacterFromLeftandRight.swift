class TakeKofEachCharacterFromLeftandRight {
    func takeCharacters(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        var map: [Character: Int] = ["a" : 0, "b" : 0, "c" : 0]
        for c in s {
            map[c]! += 1
        }
        guard !map.values.contains(where: { $0 < k }) else {
            return -1
        }
        var result = Int.max
        var i = s.count - 1, j = s.count - 1
        while i >= 0 {
            map[s[i]]! -= 1
            while map[s[i]]! < k {
                map[s[j]]! += 1
                j -= 1
            }
            i -= 1
            result = min(result, i + s.count - j)
        }
        return result
    }
    
    func tests() {
        print(takeCharacters("aabaaaacaabc", 2)) // 8
        print(takeCharacters("a", 1)) // -1
    }
}

