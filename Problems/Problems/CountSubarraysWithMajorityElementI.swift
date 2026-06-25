final class CountSubarraysWithMajorityElementI {
    func countMajoritySubarrays(_ nums: [Int], _ target: Int) -> Int {
        var result = 0
        for i in 0..<nums.count {
            var count = 0
            for num in nums.dropFirst(i) {
                count += (num == target ? 1 : -1)
                if count > 0 {
                    result += 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(countMajoritySubarrays([1,2,2,3], 2)) // 5
        print(countMajoritySubarrays([1,1,1,1], 1)) // 10
        print(countMajoritySubarrays([1,2,3], 4)) // 0
    }
}
