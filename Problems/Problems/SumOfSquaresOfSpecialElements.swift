class SumOfSquaresOfSpecialElements {
    func sumOfSquares(_ nums: [Int]) -> Int {
        let n = nums.count
        let sqrt = Int(Double(n).squareRoot())
        var result = 0
        for i in 0..<sqrt where n % (i + 1) == 0 {
            let first = nums[i]
            result += (first * first)
            let second = nums[n / (i + 1) - 1]
            result += (second * second)
        }
        if sqrt * sqrt == n {
            result -= nums[sqrt - 1] * nums[sqrt - 1]
        }
        return result
    }
    
    func tests() {
        print(sumOfSquares([2])) // 4
        print(sumOfSquares([1,2,3,4])) // 21
        print(sumOfSquares([2,7,1,19,18,3])) // 63
    }
}
