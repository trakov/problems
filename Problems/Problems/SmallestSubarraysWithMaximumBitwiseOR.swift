final class SmallestSubarraysWithMaximumBitwiseOR {
    func smallestSubarrays(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var pos = Array(repeating: -1, count: 31)
        var result = Array(repeating: 1, count: n)
        for i in (0..<n).reversed() {
            var j = i
            for bit in 0..<31 {
                if nums[i] & (1 << bit) == 0 {
                    if pos[bit] != -1 {
                        j = max(j, pos[bit])
                    }
                } else {
                    pos[bit] = i
                }
            }
            result[i] = j - i + 1
        }
        return result
    }
    
    func tests() {
        print(smallestSubarrays([1,0,2,1,3])) // [3,3,2,2,1]
        print(smallestSubarrays([1,2])) // [2,1]
    }
}
