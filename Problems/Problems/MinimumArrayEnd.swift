class MinimumArrayEnd {
    func minEnd(_ n: Int, _ x: Int) -> Int {
        var result = x
        var mask = 1
        var n = n - 1
        while n > 0 {
            if mask & x == 0 {
                result |= (n & 1) * mask
                n >>= 1
            }
            mask <<= 1
        }
        return result
    }
    
    func tests() {
        print(minEnd(3, 4)) // 6
        print(minEnd(2, 7)) // 15
    }
}

