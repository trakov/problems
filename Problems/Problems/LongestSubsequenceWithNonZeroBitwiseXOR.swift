final class LongestSubsequenceWithNonZeroBitwiseXOR {
    func longestSubsequence(_ nums: [Int]) -> Int {
        let n = nums.count
        var totalXor = 0
        var allZero = true
        for num in nums {
            totalXor ^= num
            allZero = allZero && (num == 0)
        }
        guard totalXor == 0 else { return n }
        return allZero ? 0 : n - 1
    }
    
    func tests() {
        print(longestSubsequence([1,2,3])) // 2
        print(longestSubsequence([2,3,4])) // 3
    }
}
