final class LeftandRightSumDifferences {
    func leftRightDifference(_ nums: [Int]) -> [Int] {
        let n = nums.count
        guard n > 1 else { return [0] }
        var result = Array(repeating: 0, count: n)
        for (i, num) in nums.enumerated().dropLast() {
            result[i + 1] = result[i] + num
        }
        var sum = 0
        for (i, num) in nums.enumerated().dropFirst().reversed() {
            result[i] = abs(result[i] - sum)
            sum += num
        }
        result[0] = sum
        return result
    }
    
    func tests() {
        print(leftRightDifference([10,4,8,3])) // [15,1,11,22]
        print(leftRightDifference([1])) // [0]
    }
}
