final class MinimumElementAfterReplacementWithDigitSum {
    func minElement(_ nums: [Int]) -> Int {
        var result = Int.max
        for num in nums {
            var (sum, num) = (0, num)
            while num > 0 {
                sum += num % 10
                num /= 10
            }
            result = min(result, sum)
        }
        return result
    }
    
    func tests() {
        print(minElement([10,12,13,14])) // 1
        print(minElement([1,2,3,4])) // 1
        print(minElement([999,19,199])) // 10
    }
}
