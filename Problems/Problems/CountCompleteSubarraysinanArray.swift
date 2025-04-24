final class CountCompleteSubarraysinanArray {
    func countCompleteSubarrays(_ nums: [Int]) -> Int {
        let n = nums.count
        var right = 0
        var map: [Int: Int] = [:]
        var result = 0
        let distinctCount = Set(nums).count
        for left in 0..<n {
            if left > 0 {
                let remove = nums[left - 1]
                map[remove, default: 0] -= 1
                if map[remove]! == 0 {
                    map[remove] = nil
                }
            }
            while right < n && map.count < distinctCount {
                let add = nums[right]
                map[add, default: 0] += 1
                right += 1
            }
            if map.count == distinctCount {
                result += n - right + 1
            }
        }
        return result
    }
    
    func tests() {
        print(countCompleteSubarrays([1,3,1,2,2])) // 4
        print(countCompleteSubarrays([5,5,5,5])) // 10
    }
}
