class ValidPerfectSquare {
    func isPerfectSquare(_ num: Int) -> Bool {
        guard num != 1 else { return true }
        var left = 1
        var right = num/2
        while left <= right {
            let mid = (left + right) / 2
            if mid * mid == num {
                return true
            } else if mid * mid > num {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return false
    }

    func tests() {
        print(isPerfectSquare(1)) // true
        print(isPerfectSquare(2000105819)) // false
        print(isPerfectSquare(2)) // false
        print(isPerfectSquare(4)) // true
        print(isPerfectSquare(16)) // true
        print(isPerfectSquare(14)) // false
        print(isPerfectSquare(1000)) // false
    }
}
