final class MaximumErasureValue {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        var sums = Array(repeating: 0, count: n)
        for (i, num) in nums.enumerated() {
            sums[i] = (i == 0) ? num : sums[i - 1] + num
        }
        var map: [Int: Int] = [:] // num: last index
        var result = 0
        var left = 0
        for (i, num) in nums.enumerated() {
            if let j = map[num] {
                left = max(left, j + 1)
            }
            result = max(result, sums[i] - (left > 0 ? sums[left - 1] : 0))
            map[num] = i
        }
        return result
    }
    
    func tests() {
        print(maximumUniqueSubarray([4,2,4,5,6])) // 17
        print(maximumUniqueSubarray([5,2,1,2,5,2,1,2,5])) // 8
        print(maximumUniqueSubarray([1,2,3])) // 6
    }
}
