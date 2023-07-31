class SumOfSquareNumbers {
    func judgeSquareSum(_ c: Int) -> Bool {
        var left = 0
        var right = Int(Double(c).squareRoot())
        while left <= right {
            let guess = left * left + right * right
            if guess < c {
                left += 1
            } else if guess > c {
                right -= 1
            } else {
                return true
            }
        }
        return false
    }

    func judgeSquareSum2(_ c: Int) -> Bool {
        guard c > 2 else { return true }
        let root = Int(Double(c).squareRoot())
        if c == root * root { return true }
        var left = 1
        var right = root
        for i in 1...root {
            let rem = c - i * i
            left = 1
            right = Int(Double(rem).squareRoot())
            if rem == right * right { return true }
            while left <= right {
                let mid = (left + right) / 2
                if rem == mid * mid {
                    return true
                } else if rem < mid * mid {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return false
    }

    func tests() {
        print(judgeSquareSum(5)) // true
        print(judgeSquareSum(3)) // false
        print(judgeSquareSum(17)) // true
        print(judgeSquareSum(18)) // true
        print(judgeSquareSum(10004)) // true
    }
}
