class AppendCharacterstoStringtoMakeSubsequence {
    func appendCharacters(_ s: String, _ t: String) -> Int {
        let s = Array(s)
        var tIndex = -1
        var sIndex = 0
        for (i, tc) in t.enumerated() {
            while tIndex != i && sIndex < s.count {
                if s[sIndex] == tc {
                    tIndex = i
                }
                sIndex += 1
            }
            if sIndex == s.count { break }
        }
        return t.count - tIndex - 1
    }
    
    func tests() {
        print(appendCharacters("coaching", "coding")) // 4
        print(appendCharacters("abcde", "a")) // 0
        print(appendCharacters("z", "abcde")) // 5
    }
}

