final class MaximumDifferenceBetweenIncreasingElements {
    func maximumDifference(_ nums: [Int]) -> Int {
        var minNum = nums[0]
        var result = -1
        for num in nums.dropFirst() {
            result = max(result, num - minNum)
            minNum = min(minNum, num)
        }
        return result > 0 ? result : -1
    }
    
    func tests() {
        print(maximumDifference([7,1,5,4])) // 4
        print(maximumDifference([9,4,3,2])) // -1
        print(maximumDifference([1,5,2,10])) // 9
    }
}
