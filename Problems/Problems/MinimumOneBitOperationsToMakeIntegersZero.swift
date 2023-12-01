class MinimumOneBitOperationsToMakeIntegersZero {
    func minimumOneBitOperations(_ n: Int) -> Int {
        var result = 0
        var k = 0
        var mask = 1
        while mask <= n {
            if (n & mask) != 0 {
                result = (1 << (k + 1)) - 1 - result
            }
            mask <<= 1
            k += 1
        }
        return result
    }
    
    func tests() {
        print(minimumOneBitOperations(3)) // 2
        print(minimumOneBitOperations(6)) // 4
    }
}

