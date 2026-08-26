final class ShortestandLexicographicallySmallestBeautifulString {
    func shortestBeautifulSubstring(_ s: String, _ k: Int) -> String {
        var total = 0
        var result = s
        let s = Array(s)
        for c in s {
            total += Int(String(c))!
        }
        guard total >= k else { return "" }
        var (cnt, left) = (0, 0)
        for (right, c) in s.enumerated() {
            cnt += Int(String(c))!
            while cnt > k || s[left] == "0" {
                cnt -= Int(String(s[left]))!
                left += 1
            }
            if cnt == k {
                let t = String(s[left..<right + 1])
                if t.count < result.count || (t.count == result.count && t < result) {
                    result = t
                }
            }
        }
        return result
    }
    
    func tests() {
        print(shortestBeautifulSubstring("100011001", 3)) // "11001"
        print(shortestBeautifulSubstring("1011", 2)) // "11"
        print(shortestBeautifulSubstring("000", 1)) // ""
    }
}
