final class MinimumRemovalstoBalanceArray {
    func minRemoval(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        let nums = nums.sorted()
        var result = n
        var right = 0
        for left in 0..<n {
            while right < n && nums[right] <= nums[left] * k {
                right += 1
            }
            result = min(result, n - (right - left))
        }
        return result
    }
    
    func tests() {
        print(minRemoval([2,1,5], 2)) // 1
        print(minRemoval([1,6,2,9], 3)) // 2
        print(minRemoval([4,6], 2)) // 0
    }
}
