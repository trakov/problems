final class AdjacentIncreasingSubarraysDetectionII {
    func maxIncreasingSubarrays(_ nums: [Int]) -> Int {
        var len = 1
        var prev = 0
        var result = 1
        for i in 1..<nums.count {
            if nums[i] > nums[i-1] {
                len += 1
            } else {
                prev = len
                len = 1
            }
            result = max(result, max(len/2, min(len, prev)))
        }
        return result
    }
    
    func tests() {
        print(maxIncreasingSubarrays([2,5,7,8,9,2,3,4,3,1])) // 3
        print(maxIncreasingSubarrays([1,2,3,4,4,4,4,5,6,7])) // 2
    }
}
