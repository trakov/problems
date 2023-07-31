class MinimumAverageDifference {
    func minimumAverageDifference(_ nums: [Int]) -> Int {
        var minIndex = 0
        var minAverageDiff = Int.max
        var leftSum = 0
        var rightSum = nums.reduce(0) { $0 + $1 }
        for (i, num) in nums.enumerated() {
            leftSum += num
            rightSum -= num
            let right = (nums.count - i - 1 == 0) ? 0 : rightSum / (nums.count - i - 1)
            let averageDiff = abs(leftSum / (i + 1) - right)
            if averageDiff == 0 {
                return i
            }
            if averageDiff < minAverageDiff {
                minAverageDiff = averageDiff
                minIndex = i
            }
        }
        
        return minIndex
    }

    func tests() {
        print(minimumAverageDifference([4,2,0])) // 2
        print(minimumAverageDifference([1,2,3,4,5])) // 0
        print(minimumAverageDifference([2,5,3,9,5,3])) // 3
        print(minimumAverageDifference([0])) // 0
    }
}
