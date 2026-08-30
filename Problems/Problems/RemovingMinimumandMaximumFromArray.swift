final class RemovingMinimumandMaximumFromArray {
    func minimumDeletions(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 2 else { return n }
        var mi: (i: Int, val: Int) = (0, Int.max)
        var ma: (i: Int, val: Int) = (0, Int.min)
        for (i, num) in nums.enumerated() {
            if num > ma.val { ma = (i, num) }
            if num < mi.val { mi = (i, num) }
        }
        let (l, r) = (min(mi.i, ma.i), max(mi.i, ma.i))
        return min(
            r + 1,
            n - l,
            l + 1 + (n - r)
        )
    }
    
    func tests() {
        print(minimumDeletions([2,10,7,5,4,1,8,6])) // 5
        print(minimumDeletions([0,-4,19,1,8,-2,-3,5])) // 3
        print(minimumDeletions([101])) // 1
    }
}
