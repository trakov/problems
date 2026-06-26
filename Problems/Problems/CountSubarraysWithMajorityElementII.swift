final class CountSubarraysWithMajorityElementII {
    func countMajoritySubarrays(_ nums: [Int], _ target: Int) -> Int {
        var result = 0
        let n = nums.count
        var pre = Array(repeating: 0, count: n * 2 + 1)
        pre[n] = 1
        var count = n
        var presum = 0
        for num in nums {
            if num == target {
                presum += pre[count]
                count += 1
                pre[count] += 1
            } else {
                count -= 1
                presum -= pre[count]
                pre[count] += 1
            }
            result += presum
        }
        return result
    }
    
    func tests() {
        print(countMajoritySubarrays([1,2,2,3], 2)) // 5
        print(countMajoritySubarrays([1,1,1,1], 1)) // 10
        print(countMajoritySubarrays([1,2,3], 4)) // 0
    }
}
