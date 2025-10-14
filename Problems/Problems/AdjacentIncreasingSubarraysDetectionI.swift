final class AdjacentIncreasingSubarraysDetectionI {
    func hasIncreasingSubarrays(_ nums: [Int], _ k: Int) -> Bool {
        var len = 1
        var prev = 0
        for (i, num) in nums.enumerated().dropFirst() {
            guard max(len/2, min(len, prev)) < k else { break }
            if num > nums[i-1] {
                len += 1
            } else {
                prev = len
                len = 1
            }
        }
        return max(len/2, min(len, prev)) >= k
    }
    
    func tests() {
        print(hasIncreasingSubarrays([2,5,7,8,9,2,3,4,3,1], 3)) // true
        print(hasIncreasingSubarrays([1,2,3,4,4,4,4,5,6,7], 5)) // false
        print(hasIncreasingSubarrays([-9,9,12,3,6], 2)) // true
        print(hasIncreasingSubarrays([463,-724,-568,415,49,977,-858,-523,243,486,149,155,-397,915,-661,458,-248,540], 3)) // false
    }
}
