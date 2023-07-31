class SlidingWindowMedian {
    
    // Better solution: using 2 heaps : > and <
    
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        guard nums.count > 0 else { return [] }
        var left = 0
        var right = k - 1
        var result: [Double] = []
        while right < nums.count {
            let window = Array(nums[left...right]).sorted()
            let mid = k / 2
            if k % 2 == 0 {
                result.append(Double(window[mid-1] + window[mid]) / 2)
            } else {
                result.append(Double(window[mid]))
            }
            right += 1
            left += 1
        }
        return result
    }
    
    func tests() {
        print(medianSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
        // [1.00000,-1.00000,-1.00000,3.00000,5.00000,6.00000]
        print(medianSlidingWindow([1,2,3,4,2,3,1,4,2], 3))
        //[2.00000,3.00000,3.00000,3.00000,2.00000,3.00000,2.00000]
    }
}
