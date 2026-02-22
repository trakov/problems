final class BinaryGap {
    func binaryGap(_ n: Int) -> Int {
        let s = String(n, radix: 2)
        var prevIndex = 0
        var result = 0
        for (i, bit) in s.enumerated() where bit == "1" {
            result = max(result, i - prevIndex)
            prevIndex = i
        }
        return result
    }
    
    func tests() {
        print(binaryGap(22)) // 2
        print(binaryGap(8)) // 0
        print(binaryGap(5)) // 2
    }
}
