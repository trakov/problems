class NumberofSubstringsContainingAllThreeCharacters {
    func numberOfSubstrings1(_ s: String) -> Int {
        var map: [Character: Int] = ["a": 0, "b": 0, "c": 0]
        let s = Array(s)
        var result = 0
        var left = 0
        for (right, c) in s.enumerated() {
            map[c]! += 1
            while map.allSatisfy({ $1 > 0 }) {
                map[s[left]]! -= 1
                left += 1
                result += s.count - right
            }
        }
        return result
    }
    
    func numberOfSubstrings(_ s: String) -> Int {
        var lastPos: [Character: Int] = ["a": -1, "b": -1, "c": -1]
        var result = 0
        for (i, c) in s.enumerated() {
            lastPos[c] = i
            result += 1 + min(lastPos["a"]!, lastPos["b"]!, lastPos["c"]!)
        }
        return result
    }
    
    func tests() {
        print(numberOfSubstrings("abcabc")) // 10
        print(numberOfSubstrings("aaacb")) // 3
        print(numberOfSubstrings("abc")) // 1
        print(numberOfSubstrings("acbbcac")) // 11
    }
}

