final class DistributeElementsIntoTwoArraysI {
    func resultArray(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = nums
        result[n - 1] = nums[1]
        var idx = 0
        var revIdx = n - 1
        for num in nums.dropFirst(2) {
            if result[idx] > result[revIdx] {
                idx += 1
                result[idx] = num
            } else {
                revIdx -= 1
                result[revIdx] = num
            }
        }
        var l = revIdx
        var r = n - 1
        while l < r {
            result.swapAt(l, r)
            l += 1
            r -= 1
        }
        return result
    }
    
    func tests() {
        print(resultArray([2,1,3])) // [2,3,1]
        print(resultArray([5,4,3,8])) // [5,3,4,8]
    }
}
