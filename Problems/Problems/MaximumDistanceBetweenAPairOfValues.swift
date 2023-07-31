class MaximumDistanceBetweenAPairOfValues {
    func maxDistance(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var left = 0
        var right = nums2.count - 1
        var result = 0
        
        for (i, num) in nums1.enumerated() {
            guard i < nums2.count else { break }
            guard num <= nums2[i] else { continue }
            left = i
            right = nums2.count - 1
            while left <= right {
                let mid = (left + right) / 2
                if num <= nums2[mid] {
                    result = max(result, mid - i)
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        
        return result
    }

    func tests() {
        print(maxDistance([55,30,5,4,2], [100,20,10,10,5])) // 2
        print(maxDistance([2,2,2], [10,10,1])) // 1
        print(maxDistance([30,29,19,5], [25,25,25,25,25])) // 2
    }
}
