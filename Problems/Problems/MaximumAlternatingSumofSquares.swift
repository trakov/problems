final class MaximumAlternatingSumofSquares {
    func maxAlternatingSum(_ nums: [Int]) -> Int {
        let nums = nums.map { $0 * $0 } .sorted()
        var result = 0
        for (i, num) in nums.enumerated() {
            result += (i < nums.count / 2) ? -num : num
        }
        return result
    }
    
    func tests() {
        print(maxAlternatingSum([1,2,3])) // 12
        print(maxAlternatingSum([1,-1,2,-2,3,-3])) // 16
    }
}
