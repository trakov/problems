class MakeLexicographicallySmallestArraybySwappingElements {
    func lexicographicallySmallestArray(_ nums: [Int], _ limit: Int) -> [Int] {
        var result = nums
        var sNums = nums.enumerated().sorted { $0.1 < $1.1 }
        while sNums.count > 0 {
            var sub = [sNums.removeLast()]
            while sNums.count > 0, abs(sub.last!.1 - sNums.last!.1) <= limit {
                sub.append(sNums.removeLast())
            }
            let indexes = sub.map { $0.0 }.sorted { $0 > $1 }
            for i in 0..<indexes.count {
                result[indexes[i]] = sub[i].1
            }
        }
        return result
    }
    
    func tests() {
        print(lexicographicallySmallestArray([1,5,3,9,8], 2)) // [1,3,5,8,9]
        print(lexicographicallySmallestArray([1,7,6,18,2,1], 3)) // [1,6,7,18,1,2]
        print(lexicographicallySmallestArray([1,7,28,19,10], 3)) // [1,7,28,19,10]
    }
}
