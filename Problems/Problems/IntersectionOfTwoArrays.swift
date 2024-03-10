class IntersectionOfTwoArrays {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var set1 = Set(nums1)
        var result: Set<Int> = []
        for num in nums2 {
            if set1.contains(num) {
                result.insert(num)
            }
        }
        return Array(result)
    }

    func intersection0(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        Array(Set(nums1.filter { nums2.contains($0) }))
    }

    func removeAll(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = nums1
        result.removeAll { !nums2.contains($0) }
        return Array(Set(result))
    }
    
    func sets(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        Array(Set(nums1).intersection(Set(nums2)))
    }
    
    func tests() {
        print(intersection([1,2,2,1], [2,2]))
        print(intersection([4,9,5], [9,4,9,8,4]))
    }
}
