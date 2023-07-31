class LongestSubarrayOf1sAfterDeletingOneElement {
    func longestSubarray(_ nums: [Int]) -> Int {
        var left = 0
        var zeroIndex = -1
        var result = 0
        for (i, num) in nums.enumerated() {
            if num == 0 {
                left = zeroIndex + 1
                zeroIndex = i
            }
            result = max(result, i - left)
        }
        return result
    }
    
    func tests() {
        print(longestSubarray([1,1,0,1])) // 3
        print(longestSubarray([0,1,1,1,0,1,1,0,1])) // 5
        print(longestSubarray([1,1,1])) // 2
    }
}

