class FindThePivotInteger {
    func pivotInteger(_ n: Int) -> Int {
        let sum = (n * n + n) / 2
        let x = Int(Double(sum).squareRoot())
        if x * x == sum {
            return x
        } else {
            return -1
        }
    }

    func pivotIntegerBS(_ n: Int) -> Int {
        var left = 1
        var right = n
        func sum(_ a: Int, _ b: Int) -> Int {
            (b - a + 1) * (a + b) / 2
        }
        while left <= right {
            let mid = (left + right) / 2
            let l = sum(1, mid)
            let r = sum(mid, n)
            if l < r {
                left = mid + 1
            } else if l > r {
                right = mid - 1
            } else {
                return mid
            }
        }
        return -1
    }
    
    func tests() {
        print(pivotInteger(8)) // 6
        print(pivotInteger(1)) // 1
        print(pivotInteger(4)) // -1
    }
}

