class MinimizeXOR {
    func minimizeXor(_ num1: Int, _ num2: Int) -> Int {
        var c = num2.nonzeroBitCount
        var x = 0
        var setBitsCount = 0
        var currentBit = 31
        while setBitsCount < c {
            if (num1 & (1<<currentBit) != 0) || (c - setBitsCount > currentBit) {
                x |= (1<<currentBit)
                setBitsCount += 1
            }
            currentBit -= 1
        }
        return x
    }
    
    func tests() {
        print(minimizeXor(3, 5)) // 3
        print(minimizeXor(1, 12)) // 3
    }
}

