final class KeepMultiplyingFoundValuesbyTwo {
    func findFinalValue(_ nums: [Int], _ original: Int) -> Int {
        let nums = Set(nums)
        var result = original
        while nums.contains(result) {
            result *= 2
        }
        return result
    }
    
    func tests() {
        print(findFinalValue([5,3,6,1,12], 3)) // 24
        print(findFinalValue([2,7,9], 4)) // 4
    }
}
