final class ConcatenationofConsecutiveBinaryNumbers {
    func concatenatedBinary(_ n: Int) -> Int {
        let mod = 1_000_000_007
        var result = 0
        var bits = 0
        for i in 1...n {
            if i & (i-1) == 0 {
                bits += 1
            }
            result = ((result << bits) | i) % mod
        }
        return result
    }
    
    func tests() {
        print(concatenatedBinary(1)) // 1
        print(concatenatedBinary(3)) // 27
        print(concatenatedBinary(12)) // 505379714
    }
}
