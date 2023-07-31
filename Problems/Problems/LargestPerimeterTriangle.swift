class LargestPerimeterTriangle {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted(by: >)
        for i in 0..<nums.count - 2 {
            if nums[i+2] + nums[i+1] > nums[i] {
                return nums[i+2] + nums[i+1] + nums[i]
            }
        }
        return 0
    }

    func tests() {
        print(largestPerimeter([2,1,2])) // 5
        print(largestPerimeter([1,2,1,10])) // 0
    }
}
