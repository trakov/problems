class MinimumChangesToMakeAlternatingBinaryString {
    func minOperations(_ s: String) -> Int {
        var zero = 0
        var one = 0
        for (i, c) in s.enumerated() {
            if c == "0" {
                zero += (i % 2 == 0) ? 0 : 1
                one += (i % 2 == 0) ? 1 : 0
            } else {
                zero += (i % 2 == 0) ? 1 : 0
                one += (i % 2 == 0) ? 0 : 1
            }
        }
        return min(zero, one)
    }
    
    func tests() {
        print(minOperations("0100")) // 1
        print(minOperations("10")) // 0
        print(minOperations("1111")) // 2
    }
}

