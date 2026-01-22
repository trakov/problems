final class MinimumPairRemovaltoSortArrayI {
    func minimumPairRemoval(_ nums: [Int]) -> Int {
        var nums = nums
        let n = nums.count
        for k in 0..<n - 1 {
            var j = 0
            var minSum = Int.max
            var sorted = true
            for i in 1..<nums.count {
                if nums[i-1] > nums[i] { sorted = false }
                let sum = nums[i-1] + nums[i]
                if sum < minSum {
                    j = i - 1
                    minSum = sum
                }
            }
            if sorted {
                return k
            } else {
                nums.replaceSubrange(j...j+1, with: [minSum])
            }
        }
        return nums.count == 1 ? n - 1 : 0
    }
    
    func tests() {
        print(minimumPairRemoval([5,2,3,1])) // 2
        print(minimumPairRemoval([1,2,2])) // 0
        print(minimumPairRemoval([-2,1,2,-1,-1,-2,-2,-1,-1,1,1])) // 10
    }
}
