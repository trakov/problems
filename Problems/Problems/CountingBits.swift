class CountingBits {
    func countBits(_ n: Int) -> [Int] {
        var memo = Array(repeating: 0, count: n + 1)
        for i in 1..<n+1 {
            memo[i] = memo[i / 2] + i%2
        }
        return memo
    }
    
    func countBits2(_ n: Int) -> [Int] {
        var bits: [Int] = []
        for i in 0...n {
            var count = 0
            var b = i
            while b != 0 {
                count += b%2
                b /= 2
            }
            bits.append(count)
        }
        return bits
    }

    func tests() {
        print(countBits(0)) // [0]
        print(countBits(1)) // [0,1]
        print(countBits(2)) // [0,1,1]
        print(countBits(3)) // [0,1,1,2]
        print(countBits(4)) // [0,1,1,2,1]
        print(countBits(5)) // [0,1,1,2,1,2]
        print(countBits(6)) // [0,1,1,2,1,2,2]
        print(countBits(7)) // [0,1,1,2,1,2,2,3]
        print(countBits(8)) // [0,1,1,2,1,2,2,3,1]
    }
}

