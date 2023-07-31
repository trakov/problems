class ValidTriangleNumber {
    func triangleNumber(_ nums: [Int]) -> Int {
        let nums = nums.filter { $0 > 0 }.sorted()
        let n = nums.count
        guard n > 2 else { return 0 }
        var result = 0
        
        for i in 2..<n {
            var left = 0
            var right = i - 1
            while left < right {
                if nums[left] + nums[right] > nums[i] {
                    result += right - left
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        
        return result
    }
    
    func tests() {
        print(triangleNumber([0,1,1,1])) // 1
        print(triangleNumber([2,2,3,4])) // 3
        print(triangleNumber([4,2,3,4])) // 4
    }
}

