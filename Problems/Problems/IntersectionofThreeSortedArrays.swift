class IntersectionofThreeSortedArrays {
    func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        let (n, m, p) = (arr1.count, arr2.count, arr3.count)
        var (i, j, k) = (0, 0, 0)
        var result: [Int] = []
        while i < n && j < m && k < p {
            if arr1[i] == arr2[j] && arr2[j] == arr3[k] {
                result.append(arr1[i])
                i += 1; j += 1; k += 1
            } else {
                if arr1[i] < arr2[j] {
                    i += 1
                } else if arr2[j] < arr3[k] {
                    j += 1
                } else {
                    k += 1
                }
            }
        }
        return result
    }
    
    func arraysIntersection2(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        var count = Array(repeating: 0, count: 2001)
        for num in arr1 + arr2 + arr3 {
            count[num] += 1
        }
        var result: [Int] = []
        for (num, c) in count.enumerated() where c == 3 {
            result.append(num)
        }
        return result
    }
    
    func tests() {
        print(arraysIntersection([1,2,3,4,5], [1,2,5,7,9], [1,3,4,5,8])) // [1,5]
        print(arraysIntersection([1,2,3], [2,3,4], [4,5,6])) // []
    }
}

