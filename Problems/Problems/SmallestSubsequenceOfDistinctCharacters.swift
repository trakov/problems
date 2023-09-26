class SmallestSubsequenceOfDistinctCharacters {
    func smallestSubsequence(_ s: String) -> String {
        var lastIndicies: [Character: Int] = [:]
        for (i, c) in s.enumerated() {
            lastIndicies[c] = i
        }
        var result: [Character] = []
        var seen: Set<Character> = []
        for (i, c) in s.enumerated() where !seen.contains(c) {
            while let last = result.last, i < lastIndicies[last]!, c < last {
                result.removeLast()
                seen.remove(last)
            }
            result.append(c)
            seen.insert(c)
        }
        return String(result)
    }
    
    func tests() {
        print(smallestSubsequence("bcabc")) // abc
        print(smallestSubsequence("cbacdcbc")) // acdb
    }
}

