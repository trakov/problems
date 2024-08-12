class MergeSortedArray {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var left = m - 1
        var i = nums1.count - 1
        var right = n - 1
        while right >= 0 {
            if left < 0 || nums1[left] < nums2[right] {
                nums1[i] = nums2[right]
                right -= 1
            } else {
                nums1[i] = nums1[left]
                nums1[left] = 0
                left -= 1
            }
            i -= 1
        }
    }
    
    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard n > 0 else { return }
        var i = 0
        var j = 0
        while j < n {
            let n2 = nums2[j]
            if (n2 <= nums1[i]) || (i > j + m - 1) {
                nums1.insert(n2, at: i)
                nums1.removeLast()
                j += 1
            }
            i += 1
        }
    }

    func tests() {
        var nums1 = [1,2,3,0,0,0]
        merge(&nums1, 3, [2,5,6], 3)
        print(nums1) // [1,2,2,3,5,6]

        nums1 = [-1,0,0,3,3,3,0,0,0]
        merge(&nums1, 6, [1,2,2], 3)
        print(nums1) // [-1, 0, 0, 1, 2, 2, 3, 3, 3]

        nums1 = [1]
        merge(&nums1, 1, [], 0)
        print(nums1) // [1]

        nums1 = [0]
        merge(&nums1, 0, [1], 1)
        print(nums1) // [1]

        nums1 = [2, 0]
        merge(&nums1, 1, [1], 1)
        print(nums1) // [1,2]

        nums1 = [4,5,6,0,0,0]
        merge(&nums1, 3, [1,2,3], 3)
        print(nums1) // [1,2,3,4,5,6]
    }
}
