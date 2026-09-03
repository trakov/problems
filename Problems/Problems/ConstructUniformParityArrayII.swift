final class ConstructUniformParityArrayII {
    func uniformArray(_ nums1: [Int]) -> Bool {
        let n = nums1.count
        guard n > 1 else { return true }
        var oddCount = 0
        var minVal = Int.max
        for num in nums1 {
            minVal = min(minVal, num)
            oddCount += num % 2
        }
        guard oddCount > 0 else { return true }
        return minVal % 2 == 1
    }
    
    func tests() {
        print(uniformArray([1,4,7])) // true
        print(uniformArray([2,3])) // false
        print(uniformArray([4,6])) // true
    }
}
