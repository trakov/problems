class MergeTwo2DArraysbySummingValues {
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        let n = nums1.count
        let m = nums2.count
        var i = 0
        var j = 0
        var result: [[Int]] = []
        while i < n, j < m {
            let (n1, n2) = (nums1[i], nums2[j])
            if n1[0] == n2[0] {
                result.append([n1[0], n1[1] + n2[1]])
                i += 1
                j += 1
            } else if n1[0] < n2[0] {
                result.append(n1)
                i += 1
            } else {
                result.append(n2)
                j += 1
            }
        }
        while i < n {
            result.append(nums1[i])
            i += 1
        }
        while j < m {
            result.append(nums2[j])
            j += 1
        }
        return result
    }
    
    func tests() {
        print(mergeArrays([[1,2],[2,3],[4,5]], [[1,4],[3,2],[4,1]]))
        // [[1,6],[2,3],[3,2],[4,6]]
        print(mergeArrays([[2,4],[3,6],[5,5]], [[1,3],[4,3]]))
        // [[1,3],[2,4],[3,6],[4,3],[5,5]]
    }
}

