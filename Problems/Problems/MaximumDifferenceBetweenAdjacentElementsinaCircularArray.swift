final class MaximumDifferenceBetweenAdjacentElementsinaCircularArray {
    func maxAdjacentDistance(_ nums: [Int]) -> Int {
        let n = nums.count
        var result = 0
        for (i, num) in nums.enumerated() {
            let diff = abs(num - nums[(i + 1) % n])
            result = max(result, diff)
        }
        return result
    }
    
    func tests() {
        print(maxAdjacentDistance([1,2,4])) // 3
        print(maxAdjacentDistance([-5,-10,-5])) // 5
    }
}
