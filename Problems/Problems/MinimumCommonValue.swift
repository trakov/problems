class MinimumCommonValue {
    func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        let m = nums2.count
        var i = 0
        var j = 0
        while i < n && j < m {
            if nums1[i] == nums2[j] {
                return nums1[i]
            } else if nums1[i] < nums2[j] {
                i += 1
            } else {
                j += 1
            }
        }
        return -1
    }
    
    func tests() {
        print(getCommon([1,2,3], [2,4])) // 2
        print(getCommon([1,2,3,6], [2,3,4,5])) // 2
    }
}

