class FindifArrayCanBeSorted {
    func canSortArray(_ nums: [Int]) -> Bool {
        var numOfSetBits = nums[0].nonzeroBitCount
        var maxOfSegment = nums[0]
        var minOfSegment = nums[0]
        var maxOfPrevSegment = Int.min
        for (i, num) in nums.enumerated().dropFirst() {
            if num.nonzeroBitCount == numOfSetBits {
                maxOfSegment = max(maxOfSegment, num)
                minOfSegment = min(minOfSegment, num)
            } else {
                if minOfSegment < maxOfPrevSegment {
                    return false
                }
                maxOfPrevSegment = maxOfSegment
                maxOfSegment = num
                minOfSegment = num
                numOfSetBits = num.nonzeroBitCount
            }
        }
        if minOfSegment < maxOfPrevSegment {
            return false
        }
        return true
    }
    
    func tests() {
        print(canSortArray([8,4,2,30,15])) // true
        print(canSortArray([1,2,3,4,5])) // true
        print(canSortArray([3,16,8,4,2])) // false
    }
}

