class CountVowelStringsinRanges {
    func isVString(_ s: String) -> Bool {
        let vowels = Set("aeiou")
        return vowels.contains(s.first!) && vowels.contains(s.last!)
    }
    
    func vowelStrings(_ words: [String], _ queries: [[Int]]) -> [Int] {
        let m = words.count
        var prefix = Array(repeating: 0, count: m + 1)
        for (i, word) in words.enumerated() {
            prefix[i + 1] = prefix[i] + (isVString(word) ? 1 : 0)
        }
        
        let n = queries.count
        var result = Array(repeating: 0, count: n)
        for (i, q) in queries.enumerated() {
            result[i] += prefix[q[1] + 1] - prefix[q[0]]
        }
        return result
    }
    
    func tests() {
        print(vowelStrings(["aba","bcb","ece","aa","e"], [[0,2],[1,4],[1,1]])) // [2,3,0]
        print(vowelStrings(["a","e","i"], [[0,2],[0,1],[2,2]])) // [3,2,1]
    }
}

