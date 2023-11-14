class UniqueLength3PalindromicSubsequences {
    func countPalindromicSubsequence(_ s: String) -> Int {
        var map: [String: [Int]] = [:]
        for (i, c) in s.enumerated() {
            map[String(c), default: []].append(i)
        }
        var result = 0
        let s = Array(s)
        for (c, indices) in map where indices.count > 1 {
            for (m, middleIndices) in map {
                if c == m {
                    result += indices.count > 2 ? 1 : 0
                } else if middleIndices.contains(where: { $0 > indices.first! && $0 < indices.last!}) {
                    result += 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(countPalindromicSubsequence("aabca")) // 3
        print(countPalindromicSubsequence("adc")) // 0
        print(countPalindromicSubsequence("bbcbaba")) // 4
        print(countPalindromicSubsequence("eyiccwp")) // 0
    }
}

