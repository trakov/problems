class NumberOf1Bits {
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        var n = n
        while n != 0 {
            count += n % 2
            n /= 2
        }
        return count
    }

    func hammingWeight2(_ n: Int) -> Int {
        var count = 0
        var n = n
        while n != 0 {
            n &= n - 1
            count += 1
        }
        return count
    }

    func tests() {
        print(hammingWeight(00000000000000000000000000001011)) // 3
        print(hammingWeight(00000000000000000000000010000000)) // 1
//        print(hammingWeight(11111111111111111111111111111101)) // 31
    }
}
