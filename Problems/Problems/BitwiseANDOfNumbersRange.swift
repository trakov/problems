class BitwiseANDOfNumbersRange {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var result = right
        for num in left...right {
            result &= num
            if result == 0 {
                break
            }
        }
        return result
    }
    
    func rangeBitwiseAnd2(_ left: Int, _ right: Int) -> Int {
        if left == 0 || right == 0 {
            return 0
        }
        var left = left
        var right = right
        var moveFactor = 1
        while right != left {
            right >>= 1
            left >>= 1
            moveFactor <<= 1
        }
        return right * moveFactor
    }

    func tests() {
        print(rangeBitwiseAnd(5, 7)) // 4
        print(rangeBitwiseAnd(0, 0)) // 0
        print(rangeBitwiseAnd(1, 2147483647)) // 0
    }
}
