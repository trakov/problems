final class LongestBalancedSubarrayI {
    func longestBalanced(_ nums: [Int]) -> Int {
        var result = 0
        for i in nums.indices {
            var odd: [Int: Int] = [:]
            var even: [Int: Int] = [:]
            for j in i..<nums.count {
                if (nums[j] & 1) == 1 {
                    odd[nums[j], default: 0] += 1
                } else {
                    even[nums[j], default: 0] += 1
                }
                if odd.count == even.count {
                    result = max(result, j - i + 1)
                }
            }
        }
        return result
    }
    
    func tests() {
        print(longestBalanced([2,5,4,3])) // 4
        print(longestBalanced([3,2,2,5,4])) // 5
        print(longestBalanced([1,2,3,2])) // 3
    }
}
