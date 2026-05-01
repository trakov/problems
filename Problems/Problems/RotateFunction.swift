final class RotateFunction {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 0 else { return 0 }
        var f = 0
        let sum = nums.reduce(0, +)
        for (i, num) in nums.enumerated() {
            f += i * num
        }
        var result = f
        for num in nums.reversed().dropLast() {
            f += sum - n * num
            result = max(result, f)
        }
        return result
    }
    
    func tests() {
        print(maxRotateFunction([4,3,2,6])) // 26
        print(maxRotateFunction([100])) // 0
    }
}
