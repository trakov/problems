final class LexicographicallySmallestStringAfterSubstringOperation {
    func smallestString(_ s: String) -> String {
        func preceding(_ c: Character) -> Character {
            if c == "a" { return "z" }
            return Character(UnicodeScalar(c.asciiValue! - 1))
        }
        var s = Array(s)
        let n = s.count
        var left = -1
        for (i, c) in s.enumerated() where c != "a" {
            left = i
            break
        }
        if left == -1 {
            s[n - 1] = preceding(s[n - 1])
        } else {
            for (i, c) in s.enumerated().dropFirst(left) {
                guard c != "a" else { break }
                s[i] = preceding(c)
            }
        }
        return String(s)
    }
    
    func tests() {
        print(smallestString("cbabc")) // "baabc"
        print(smallestString("aa")) // "az"
        print(smallestString("acbbc")) // "abaab"
        print(smallestString("leetcode")) // "kddsbncd"
    }
}
