class FindAllAnagramsInAString {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        guard s.count >= p.count else { return [] }
        let s = Array(s)
        let p = Array(p)
        
        func isZeroArray(_ array: [Int]) -> Bool {
            for a in array {
                guard a == 0 else { return false }
            }
            return true
        }
        
        func index(of char: Character) -> Int {
            Int(char.asciiValue!) - Int(Character("a").asciiValue!)
        }
        
        var array = Array(repeating: 0, count: 26)
        for (i, c) in p.enumerated() {
            array[index(of: c)] += 1
            array[index(of: s[i])] -= 1
        }

        var result: [Int] = []
        if isZeroArray(array) { result.append(0) }
        for i in 0..<(s.count - p.count) {
            array[index(of: s[i])] += 1
            array[index(of: s[p.count + i])] -= 1
            if isZeroArray(array) { result.append(i + 1) }
        }
        
        return result
    }

    func findAnagrams2(_ s: String, _ p: String) -> [Int] {
        guard s.count >= p.count else { return [] }
        let s = Array(s)
        let p = Array(p).sorted()
        var map: [Character: Int] = [:]
        for c in p {
            map[c, default: 0] += 1
        }
        var result: [Int] = []
        var i = 0
        while i <= s.count - p.count {
            if map[s[i]] == nil {
                i += 1
                continue
            }
            let str = s[i..<p.count+i]
            if str.sorted() == p {
                result.append(i)
                for j in i..<s.count-p.count {
                    if s[j] == s[j+p.count] {
                        i += 1
                        result.append(i)
                    } else {
                        break
                    }
                }
            }
            i += 1
        }
        return result
    }

    func tests() {
        print(findAnagrams("acdcaeccde", "c")) // 1,3,6,7
        print(findAnagrams("baa", "aa")) // 1
        print(findAnagrams("cbaebabacd", "abc")) // 0, 6
        print(findAnagrams("abab", "ab")) // 0,1,2
    }
}
