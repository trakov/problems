final class LexicographicallySmallestGeneratedString {
    func generateString(_ str1: String, _ str2: String) -> String {
        let (n, m) = (str1.count, str2.count)
        let str2 = Array(str2)
        var s: [Character] = Array(repeating: "a", count: n + m - 1)
        var fixed = Array(repeating: 0, count: n + m - 1)
        for (i, c) in str1.enumerated() where c == "T" {
            for j in i..<i+m {
                if fixed[j] == 1 && s[j] != str2[j - i] { return "" }
                s[j] = str2[j - i]
                fixed[j] = 1
            }
        }
        for (i, c) in str1.enumerated() where c == "F" {
            var flag = false
            var idx = -1
            for j in (i...i+m-1).reversed() {
                if str2[j - i] != s[j] { flag = true }
                if idx == -1 && fixed[j] == 0 { idx = j }
            }
            guard !flag else { continue }
            guard idx != -1 else { return "" }
            s[idx] = "b"
        }
        return String(s)
    }
    
    func tests() {
        print(generateString("TFTF", "ab")) // "ababa"
        print(generateString("TFTF", "abc")) // ""
        print(generateString("F", "d")) // "a"
    }
}
