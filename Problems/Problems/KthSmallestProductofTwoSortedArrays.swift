final class KthSmallestProductofTwoSortedArrays {
    func kthSmallestProduct(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        let (n1, n2) = (nums1.count, nums2.count)
        var (pos1, pos2) = (0, 0)
        while pos1 < n1 && nums1[pos1] < 0 {
            pos1 += 1
        }
        while pos2 < n2 && nums2[pos2] < 0 {
            pos2 += 1
        }
        var (left, right) = (-10000000000, 10000000000)
        while left <= right {
            let mid = (left + right) / 2
            var count = 0
            var (i1, i2) = (0, pos2 - 1)
            while i1 < pos1 && i2 >= 0 {
                if nums1[i1] * nums2[i2] > mid {
                    i1 += 1
                } else {
                    count += pos1 - i1
                    i2 -= 1
                }
            }
            i1 = pos1
            i2 = n2 - 1
            while i1 < n1 && i2 >= pos2 {
                if nums1[i1] * nums2[i2] > mid {
                    i2 -= 1
                } else {
                    count += i2 - pos2 + 1
                    i1 += 1
                }
            }
            i1 = 0
            i2 = pos2
            while i1 < pos1 && i2 < n2 {
                if nums1[i1] * nums2[i2] > mid {
                    i2 += 1
                } else {
                    count += n2 - i2
                    i1 += 1
                }
            }
            i1 = pos1
            i2 = 0
            while i1 < n1 && i2 < pos2 {
                if nums1[i1] * nums2[i2] > mid {
                    i1 += 1
                } else {
                    count += n1 - i1
                    i2 += 1
                }
            }
            if count < k {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left
    }
    
    func tests() {
        print(kthSmallestProduct([2,5], [3,4], 2)) // 8
        print(kthSmallestProduct([-4,-2,0,3], [2,4], 6)) // 0
        print(kthSmallestProduct([-2,-1,0,1,2], [-3,-1,2,4,5], 3)) // -6
    }
}
