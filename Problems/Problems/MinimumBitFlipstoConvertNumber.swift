class MinimumBitFlipstoConvertNumber {
    // count bits
    func minBitFlips(_ start: Int, _ goal: Int) -> Int {
        var diffBits = start ^ goal
        var flipCount = 0

        while diffBits != 0 {
            flipCount += Int(diffBits & 1)
            diffBits >>= 1
        }

        return flipCount
    }

    // nonzeroBitCount
    func minBitFlips1(_ start: Int, _ goal: Int) -> Int {
       (start ^ goal).nonzeroBitCount
    }

    func minBitFlips2(_ start: Int, _ goal: Int) -> Int {
        if start == goal { return 0 }
        return minBitFlips(start / 2, goal / 2) + (start % 2 == goal % 2 ? 0 : 1)
    }
    
    func tests() {
        print(minBitFlips(10, 7)) // 3
        print(minBitFlips(3, 4)) // 3
    }
}

