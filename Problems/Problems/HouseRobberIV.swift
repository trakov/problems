class HouseRobberIV {
    func minCapability(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var left = 1
        var right = nums.max()!
        while left < right {
            let mid = (left + right) / 2
            var count = 0
            var i = 0
            while i < n {
                if nums[i] <= mid {
                    count += 1
                    i += 1
                }
                i += 1
            }
            if count >= k {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    func tests() {
        print(minCapability([2,3,5,9], 2)) // 5
        print(minCapability([2,7,9,3,1], 2)) // 2
    }
}

