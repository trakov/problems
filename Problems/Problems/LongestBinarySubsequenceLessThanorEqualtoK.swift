import Foundation
final class LongestBinarySubsequenceLessThanorEqualtoK {
    func longestSubsequence(_ s: String, _ k: Int) -> Int {
        var sm = 0
        var result = 0
        var bits = Int(log(Double(k)) / log(2)) + 1
        let s = Array(s)
        for i in 0..<s.count {
            var c = s[s.count - 1 - i]
            if c == "1" {
                if i < bits && sm + (1 << i) <= k {
                    sm += 1 << i
                    result += 1
                }
            } else {
                result += 1
            }
        }
        return result
    }
    
    func tests() {
        print(longestSubsequence("1001010", 5)) // 5
        print(longestSubsequence("00101001", 1)) // 6
    }
}
