class IntersectionOfTwoArrays2 {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1 = nums1.sorted()
        let nums2 = nums2.sorted()
        var result: [Int] = []
        var i = 0
        var j = 0
        while i < nums1.count, j < nums2.count {
            if nums1[i] == nums2[j] {
                result.append(nums1[i])
                i += 1
                j += 1
            } else if nums2[j] < nums1[i] {
                j += 1
            } else {
                i += 1
            }
        }
        return result
    }
    
    func intersect2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result: [Int] = []
        var nums11 = nums1
        for n in nums2 {
            if nums11.contains(n) {
                result.append(n)
                if let index = nums11.firstIndex(of: n) {
                    nums11.remove(at: index)
                }
            }
        }
        return result
    }

    func tests() {
        print(intersect([1,2], [1,1])) // [1]
        print(intersect([1,2,2,1], [2,2])) // [2,2]
        print(intersect([4,9,5], [9,4,9,8,4])) // [4,9]
        print(intersect([1,2,2,1], [2])) // [2]
    }
}
