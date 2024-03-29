class CountSubarraysWhereMaxElementAppearsAtLeastKTimes {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        let maxVal = nums.max()!
        var count = 0
        var left = 0
        var result = 0
        for num in nums {
            if num == maxVal {
                count += 1
            }
            while k == count {
                if nums[left] == maxVal {
                    count -= 1
                }
                left += 1
            }
            result += left
        }
        return result
    }
    
    func tests() {
        print(countSubarrays([1,3,2,3,3], 2)) // 6
        print(countSubarrays([1,4,2,1], 3)) // 0
    }
}

