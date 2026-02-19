final class CountBinarySubstrings {
    func countBinarySubstrings(_ s: String) -> Int {
        var result = 0
        var isZero = s.first == "0"
        var zeros = isZero ? 1 : 0
        var ones = isZero ? 0 : 1
        for c in s.dropFirst() {
            if c == "0" {
                if isZero {
                    zeros += 1
                } else {
                    result += min(zeros, ones)
                    zeros = 1
                }
            } else {
                if !isZero {
                    ones += 1
                } else {
                    result += min(zeros, ones)
                    ones = 1
                }
            }
            isZero = c == "0"
        }
        return result + min(zeros, ones)
    }
    
    func tests() {
        print(countBinarySubstrings("00110011")) // 6
        print(countBinarySubstrings("10101")) // 4
    }
}
