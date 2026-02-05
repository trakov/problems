final class TrionicArrayII {
    func maxSumTrionic(_ nums: [Int]) -> Int {
        var result = Int.min
        var i = 1
        while i < nums.count {
            let (prev, cur) = (nums[i - 1], nums[i])
            guard prev < cur else {
                i += 1
                continue
            }
            // find increasing array finished at lastIncIndex
            var lastIncIndex = i
            var incSum = prev + cur
            while lastIncIndex < nums.count - 1, nums[lastIncIndex] < nums[lastIncIndex + 1] {
                lastIncIndex += 1
                incSum += nums[lastIncIndex]
            }
            // check
            guard lastIncIndex < nums.count - 2, nums[lastIncIndex] > nums[lastIncIndex + 1] else {
                i = lastIncIndex + 1
                continue
            }
            // find max incSum
            if i < lastIncIndex {
                var tempSum = incSum
                for j in i-1...lastIncIndex-2 {
                    tempSum -= nums[j]
                    incSum = max(incSum, tempSum)
                }
            }
            // continue summing for the dec numbers from lastIncIndex
            var lastDecIndex = lastIncIndex + 1
            while lastDecIndex < nums.count - 1, nums[lastDecIndex - 1] > nums[lastDecIndex] {
                incSum += nums[lastDecIndex]
                lastDecIndex += 1
            }
            guard nums[lastDecIndex - 1] < nums[lastDecIndex] else {
                i = lastDecIndex
                continue
            }
            // find max inc subarray sum - SUM it with incSum - update result
            lastIncIndex = lastDecIndex
            incSum += nums[lastIncIndex]
            var tempSum = incSum
            while lastIncIndex < nums.count - 1, nums[lastIncIndex] < nums[lastIncIndex + 1] {
                lastIncIndex += 1
                tempSum += nums[lastIncIndex]
                incSum = max(incSum, tempSum)
            }
            result = max(result, incSum)
            i = lastDecIndex - 1
        }
        
        return result
    }
    
    func tests() {
        print(maxSumTrionic([0,-2,-1,-3,0,2,-1])) // -4
        print(maxSumTrionic([1,4,2,7])) // 14
        print(maxSumTrionic([-533,224,-324,251,231,479])) // 637
        print(maxSumTrionic([447,530,-807,771,408,-307])) // 941
        print(maxSumTrionic([-754,167,-172,202,735,-941,992])) // 988
    }
}
