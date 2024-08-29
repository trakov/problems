class MedianOfTwoSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        if (m > n) {
            return findMedianSortedArrays(nums2, nums1)
        }
        var (left, right) = (0, m)
        
        while left <= right {
            let partitionA = (left + right) / 2;
            let partitionB = (m + n + 1) / 2 - partitionA;
            
            let maxLeftA = (partitionA == 0) ? Int.min : nums1[partitionA - 1]
            let minRightA = (partitionA == m) ? Int.max : nums1[partitionA]
            let maxLeftB = (partitionB == 0) ? Int.min : nums2[partitionB - 1]
            let minRightB = (partitionB == n) ? Int.max : nums2[partitionB]
            
            if maxLeftA <= minRightB && maxLeftB <= minRightA {
                if (m + n) % 2 == 0 {
                    return (Double(
                        (max(maxLeftA, maxLeftB) + min(minRightA, minRightB))
                    ) / 2.0)
                } else {
                    return Double(max(maxLeftA, maxLeftB))
                }
            } else if maxLeftA > minRightB {
                right = partitionA - 1
            } else {
                left = partitionA + 1
            }
        }
        return 0.0
    }
        
    func findMedianSortedArrays1(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count = nums1.count + nums2.count
        guard count > 0 else {
            fatalError()
        }
        let right = count / 2
        var i = 0
        var j = 0
        var k = 0
        var num1 = 0
        var num2 = 0
        while k <= right {
            guard let a = (nums1.count > i ? nums1[i] : nil) else {
                if k == right - 1 { num1 = nums2[j] }
                if k == right { num2 = nums2[j] }
                j += 1
                k += 1
                continue
            }
            guard let b = (nums2.count > j ? nums2[j] : nil) else {
                if k == right - 1 { num1 = nums1[i] }
                if k == right { num2 = nums1[i] }
                i += 1
                k += 1
                continue
            }
            if a <= b {
                if k == right - 1 { num1 = nums1[i] }
                if k == right { num2 = nums1[i] }
                i += 1
            } else {
                if k == right - 1 { num1 = nums2[j] }
                if k == right { num2 = nums2[j] }
                j += 1
            }
            k += 1
        }
        
        return count % 2 == 0 ? Double(num1 + num2) / 2.0 : Double(num2)
    }
    
    func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
	    let count = nums1.count + nums2.count
	    guard count > 0 else {
    	    fatalError()
	    }
	    let right = count / 2
	    var left = right
	    if right * 2 == count {
    	    left -= 1
	    }
	    
	    var aIndex = 0
	    var bIndex = 0
	    var temp = [Int]()
	    while temp.count <= right {
    	    let a: Int? = nums1.count > aIndex ? nums1[aIndex] : nil
    	    let b: Int? = nums2.count > bIndex ? nums2[bIndex] : nil
    	    if a != nil {
	    	    if b != nil {
    	    	    if a! <= b! {
	    	    	    temp.append(a!)
	    	    	    aIndex += 1
    	    	    } else {
	    	    	    temp.append(b!)
	    	    	    bIndex += 1
    	    	    }
	    	    } else {
    	    	    temp.append(a!)
    	    	    aIndex += 1
	    	    }
    	    } else if b != nil {
	    	    temp.append(b!)
	    	    bIndex += 1
    	    }
	    }
	    return Double(temp[left] + temp[right]) / 2.0
    }
    
    func tests() {
	    print(findMedianSortedArrays([1,3], [2])) // 2.0
	    print(findMedianSortedArrays([1,2], [3,4])) // 2.5
    }
}

