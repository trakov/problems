class MaximumProductSubarray {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        var result = nums[0]
        var maxValue = result
        var minValue = result
        
        for i in 1..<nums.count {
            let num = nums[i]
            (minValue, maxValue) = (
                min(num, maxValue * num, minValue * num),
                max(num, maxValue * num, minValue * num)
            )
            result = max(result, maxValue)
        }
        return result
    }

    func tests() {
        print(maxProduct([2,3,-2,4])) // 6
        print(maxProduct([-2,0,-1])) // 0
    }
}
