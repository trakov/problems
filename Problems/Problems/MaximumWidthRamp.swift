class MaximumWidthRamp {
    func maxWidthRamp(_ nums: [Int]) -> Int {
        var stack: [Int] = [] // indices of mins
        for (i, num) in nums.enumerated() {
            if stack.isEmpty || nums[stack.last!] > num {
                stack.append(i)
            }
        }
        var result = 0
        for (j, num) in nums.enumerated().reversed() {
            while let i = stack.last, nums[i] <= num {
                result = max(result, j - stack.removeLast())
            }
        }
        return result
    }
    
    func tests() {
        print(maxWidthRamp([6,0,8,2,1,5])) // 4
        print(maxWidthRamp([9,8,1,0,1,9,4,0,4,1])) // 7
    }
}

