final class MakeArrayElementsEqualtoZero {
    func countValidSelections(_ nums: [Int]) -> Int {
        var result = 0
        var leftSum = 0
        var rightSum = nums.reduce(0, +)
        for num in nums {
            if num == 0 {
                if leftSum - rightSum >= 0, leftSum - rightSum <= 1 {
                    result += 1
                }
                if rightSum - leftSum >= 0, rightSum - leftSum <= 1 {
                    result += 1
                }
            } else {
                leftSum += num
                rightSum -= num
            }
        }
        return result
    }
    
    func tests() {
        print(countValidSelections([1,0,2,0,3])) // 2
        print(countValidSelections([2,3,4,0,4,1,0])) // 0
    }
}
