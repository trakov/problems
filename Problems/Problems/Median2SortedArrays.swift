
func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let result = 0.0
    let n = nums1.count
    let m = nums2.count
    let big: [Int]
    let small: [Int]
    if n >= m {
        big = nums1
        small = nums2
    } else {
        big = nums2
        small = nums1
    }
    if let med = median(array: big, of: n + m), Double(small.first!) >= med {
        return med
    }
    if let med = median(array: big, of: big.count - small.count), Double(small.last!) <= med {
        return med
    }
    return result
}

func findMedianSortedArrays3(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let count = nums1.count + nums2.count
    guard count > 0 else {
        fatalError("BOOM!")
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

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let count = nums1.count + nums2.count
    guard count > 0 else {
        fatalError("BOOM!")
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

func median(array: [Int], of count: Int? = nil) -> Double? {
    guard let medIndexes = medIndexes(of: count ?? array.count) else { return nil }
    print("\(array) - \(count) : \(medIndexes)")
    return Double(array[medIndexes.left] + array[medIndexes.right]) / 2.0
}

func medIndexes(of count: Int) -> (left: Int, right: Int)? {
    guard count > 0 else { return nil }
    let right = count / 2
    var left = right
    if right * 2 == count {
        left -= 1
    }
    return (left, right)
}

func tests() {
    findMedianSortedArrays([5, 6, 7, 7], [1])
    
    median(array: [])
    median(array: [1])
    median(array: [1, 2])
    median(array: [1, 2, 3])
    median(array: [1, 2, 3, 4])
}
