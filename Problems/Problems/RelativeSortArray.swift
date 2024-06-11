class RelativeSortArray {
    // counting sort
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        guard arr1.count != arr2.count else { return arr2 }
        let maxElement = arr1.max()!
        var count = Array(repeating: 0, count: maxElement + 1)
        for num in arr1 {
            count[num] += 1
        }
        var result = arr1
        var idx = 0
        for num in arr2 {
            for i in idx..<idx + count[num] {
                result[i] = num
            }
            idx += count[num]
            count[num] = 0
        }
        for (num, c) in count.enumerated() where c != 0 {
            for i in idx..<idx + c {
                result[i] = num
            }
            idx += c
        }
        return result
    }

    func relativeSortArray1(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        guard arr1.count != arr2.count else { return arr2 }
        let n = arr1.count
        var map: [Int: Int] = [:]
        for num in arr1 {
            map[num, default: 0] += 1
        }
        var result = arr1
        var idx = 0
        for num in arr2 {
            guard let count = map[num] else { fatalError() }
            for i in idx..<idx + count {
                result[i] = num
            }
            idx += count
            map[num] = nil
        }
        let sortedMap = map.sorted { $0.key < $1.key }
        for (num, count) in sortedMap {
            for i in idx..<idx + count {
                result[i] = num
            }
            idx += count
        }
        return result
    }
    
    func tests() {
        print(relativeSortArray([2,3,1,3,2,4,6,7,9,2,19], [2,1,4,3,9,6]))
        // [2,2,2,1,4,3,3,9,6,7,19]
        print(relativeSortArray([28,6,22,8,44,17], [22,28,8,6]))
        // [22,28,8,6,17,44]
    }
}

