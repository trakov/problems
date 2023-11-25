class SumOfAbsoluteDifferencesInASortedArray {
    func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var leftSum = 0
        var rightSum = nums.reduce(0, +)
        var result = nums
        for (i, num) in nums.enumerated() {
            rightSum -= num
            result[i] = rightSum - leftSum - (n - 1 - 2 * i) * num
            leftSum += num
        }
        return result
    }
    
    func tests() {
        print(getSumAbsoluteDifferences([2,3,5])) // [4,3,5]
        print(getSumAbsoluteDifferences([1,4,6,8,10])) // [24,15,13,15,21]
    }
}

