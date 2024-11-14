class MinimizedMaximumofProductsDistributedtoAnyStore {
    func minimizedMaximum(_ n: Int, _ quantities: [Int]) -> Int {
        func canDistribute(_ x: Int) -> Bool {
            var j = 0
            var remaining = quantities[j]
            for _ in 0..<n {
                if remaining <= x {
                    j += 1
                    if j == quantities.count {
                        return true
                    } else {
                        remaining = quantities[j]
                    }
                } else {
                    remaining -= x
                }
            }
            return false
        }
        var left = 0
        var right = quantities.max()!
        while left < right {
            let middle = (left + right) / 2
            if canDistribute(middle) {
                right = middle
            } else {
                left = middle + 1
            }
        }
        return left
    }

    func tests() {
        print(minimizedMaximum(6, [11,6])) // 3
        print(minimizedMaximum(7, [15,10,10])) // 5
        print(minimizedMaximum(1, [100000])) // 100000
    }
}

