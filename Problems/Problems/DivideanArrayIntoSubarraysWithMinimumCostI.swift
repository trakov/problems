final class DivideanArrayIntoSubarraysWithMinimumCostI {
    func minimumCost(_ nums: [Int]) -> Int {
        var (min1, min2) = (Int.max, Int.max)
        for num in nums.dropFirst() {
            if num <= min1 {
                min2 = min1
                min1 = num
            } else if num < min2 {
                min2 = num
            }
        }
        return nums[0] + min1 + min2
    }
    
    func tests() {
        print(minimumCost([1,2,3,12])) // 6
        print(minimumCost([5,4,3])) // 12
        print(minimumCost([10,3,1,1])) // 12
    }
}
