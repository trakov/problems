class FindTheDifferenceOfTwoArrays {
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        var nums1 = Set(nums1)
        var nums2 = Set(nums2)
        let res1 = Array(nums1.subtracting(nums2))
        let res2 = Array(nums2.subtracting(nums1))
        return [res1, res2]
    }
    
    func tests() {
        print(findDifference([1,2,3], [2,4,6])) // [[1,3],[4,6]]
        print(findDifference([1,2,3,3], [1,1,2,2])) // [[3],[]]
    }
}

