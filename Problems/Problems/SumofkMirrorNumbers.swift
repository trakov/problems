final class SumofkMirrorNumbers {
    func kMirror(_ k: Int, _ n: Int) -> Int {
        var digit: [Int] = Array(repeating: 0, count: 100)
        func isPalindrome(_ x: Int, _ k: Int) -> Bool {
            var length = -1
            var x = x
            while x > 0 {
                length += 1
                digit[length] = x % k
                x /= k
            }
            var j = length
            for i in 0..<j {
                if digit[i] != digit[j] {
                    return false
                }
                j -= 1
            }
            return true
        }
        var left = 1
        var count = 0
        var result = 0
        while count < n {
            var right = left * 10
            for op in 0..<2 {
                for i in left..<right {
                    guard count < n else { break }
                    var combined = i
                    var x = op == 0 ? i / 10 : i
                    while x > 0 {
                        combined = combined * 10 + (x % 10)
                        x /= 10
                    }
                    if isPalindrome(combined, k) {
                        count += 1
                        result += combined
                    }
                }
            }
            left = right
        }
        return result
    }
    
    func tests() {
        print(kMirror(2, 5)) // 25
        print(kMirror(3, 7)) // 499
        print(kMirror(7, 17)) // 20379000
    }
}
