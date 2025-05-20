final class ZeroArrayTransformationI {
    func isZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Bool {
        let n = nums.count
        var delta = Array(repeating: 0, count: n + 1)
        for query in queries {
            let (a, b) = (query[0], query[1])
            delta[a] += 1
            delta[b + 1] -= 1
        }
        var ops = Array(repeating: 0, count: n + 1)
        var cur = 0
        for (i, d) in delta.enumerated() {
            cur += d
            ops[i] = cur
        }
        for (op, num) in zip(ops, nums) where op < num {
            return false
        }
        return true
    }
    
    func tests() {
        print(isZeroArray([1,0,1], [[0,2]])) // true
        print(isZeroArray([4,3,2,1], [[1,3],[0,2]])) // false
    }
}
