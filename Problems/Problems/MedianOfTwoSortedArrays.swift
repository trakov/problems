class MedianOfTwoSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
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

