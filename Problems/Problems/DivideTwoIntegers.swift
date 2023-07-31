class DivideTwoIntegers {
    
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == Int(Int32.min) && divisor == -1 {
            return Int(Int32.max)
        }
        let sign = dividend.signum() * divisor.signum()
        var a = abs(dividend)
        let b = abs(divisor)
        var result = 0
        while a >= b {
            var shift = 0
            while a >= b << (shift + 1) {
                shift += 1
            }
            result += 1 << shift
            a -= b << shift
        }
        return result * sign
    }
    
    func divide3(_ dividend: Int, _ divisor: Int) -> Int {
        guard abs(dividend) >= abs(divisor) else { return 0 }
        let sign = dividend.signum() * divisor.signum()
        var a = abs(dividend)
        var b = abs(divisor)
        var result = 1
        var temp = 1
        while a - temp > 0 {
            while a > b << 1 {
                b <<= 1
                temp <<= 1
            }
            if b == abs(divisor) { return sign }
            a -= temp
            result += temp
            temp = 1
            b = abs(divisor)
        }
        return sign * result
    }

    func divide2(_ dividend: Int, _ divisor: Int) -> Int {
        let result = dividend/divisor
        if result > Int32.max {
            return Int(Int32.max)
        } else if result < Int32.min {
            return Int(Int32.min)
        }
        return result
    }
    
    func tests() {
        print(divide(10, 3)) // 3
        print(divide(7, -3)) // -2
        print(divide(-2147483648, -1)) // 2147483647
    }
}

