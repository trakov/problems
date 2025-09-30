final class FindTriangularSumofanArray {
    func triangularSum(_ nums: [Int]) -> Int {
        var nums = nums
        let n = nums.count
        guard n > 1 else { return nums[0] }
        for i in 0..<n-1 {
            for j in 0..<n-1-i {
                nums[j] = (nums[j] + nums[j+1]) % 10
            }
        }
        return nums[0]
    }
    
    func tests() {
        print(triangularSum([1,2,3,4,5])) // 8
        print(triangularSum([5])) // 5
    }
}
