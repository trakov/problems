class HouseRobber {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        var now = 0
        var last = 0
        for num in nums {
            (last, now) = (now, max(now, num + last))
            print(now, " - ", last)
        }
        return now

        
//        guard nums.count > 2 else { return nums.max()! }
//        var candidates = [
//            nums[0],
//            nums[1],
//            nums[2],
//            nums[0] + nums[2]
//        ]
//        var i = 0
//        while i < nums.count / 4 {
//            var s0 = nums[i * nums.count]
//            var s1 = nums[i * nums.count + 1]
//            var s2 = nums[i * nums.count + 2]
//            var s02 = nums[i * nums.count + 3]
//            s0 = max(candidates[0] + s0, candidates[1] + s0)
//            s1 = max(candidates[1] + s1, max(candidates[2] + s1, candidates[3] + s1))
//            s2 = max(candidates[2] + s2, candidates[3] + s1)
//            s02 = max(candidates[0] + s02, candidates[1] + s02)
//            candidates = [s0, s1, s2, s02]
//            i += 1
//        }
//
//
//
//        return candidates.max()!
    }

    func tests() {
        print(rob([1,2,3,1])) // 4
        print(rob([1,2,3,1,1,2,3,1])) // 8
        print(rob([2,7,9,3,1])) // 12
        print(rob([2,1,5,9,3,1])) // 12
    }
}
