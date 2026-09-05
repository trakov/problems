final class SmallestStableIndexII {
    func firstStableIndex(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        guard n > 1 else { return 0 }
        var maxes = nums
        for (i, num) in nums.enumerated().dropFirst() {
            maxes[i] = max(num, maxes[i - 1])
        }
        var minis = nums
        for (i, num) in nums.enumerated().dropLast().reversed() {
            minis[i] = min(num, minis[i + 1])
        }
        for (i, (ma, mi)) in zip(maxes, minis).enumerated() {
            if ma - mi <= k { return i }
        }
        return -1
    }
    
    func tests() {
        print(firstStableIndex([5,0,1,4], 3)) // 3
        print(firstStableIndex([3,2,1], 1)) // -1
        print(firstStableIndex([0], 0)) // 0
    }
}
