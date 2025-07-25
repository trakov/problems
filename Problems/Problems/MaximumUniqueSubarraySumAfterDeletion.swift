final class MaximumUniqueSubarraySumAfterDeletion {
    func maxSum(_ nums: [Int]) -> Int {
        var set: Set<Int> = []
        var result = 0
        var maxEl = Int.min
        for num in nums {
            maxEl = max(maxEl, num)
            guard num > 0 else { continue }
            if set.insert(num).inserted {
                result += num
            }
        }
        return maxEl >= 0 ? result : maxEl
    }
    
    func tests() {
        print(maxSum([1,2,3,4,5])) // 15
        print(maxSum([1,1,0,1,1])) // 1
        print(maxSum([1,2,-1,-2,1,0,-1])) // 3
    }
}
