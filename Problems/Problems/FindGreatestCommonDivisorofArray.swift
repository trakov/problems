final class FindGreatestCommonDivisorofArray {
    func findGCD(_ nums: [Int]) -> Int {
        var minVal = Int.max
        var maxVal = Int.min
        for num in nums {
            minVal = min(minVal, num)
            maxVal = max(maxVal, num)
        }
        while maxVal != 0 {
            (minVal, maxVal) = (maxVal, minVal % maxVal)
        }
        return minVal
    }
    
    func tests() {
        print(findGCD([2,5,6,9,10])) // 2
        print(findGCD([7,5,6,8,3])) // 1
        print(findGCD([3,3])) // 3
    }
}
