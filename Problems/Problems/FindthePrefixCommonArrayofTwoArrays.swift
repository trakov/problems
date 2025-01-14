class FindthePrefixCommonArrayofTwoArrays {
    func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        var set: Set<Int> = []
        var result = Array(repeating: 0, count: A.count)
        var count = 0
        for (i, (a, b)) in zip(A, B).enumerated() {
            if !set.insert(a).inserted {
                set.remove(a)
                count += 1
            }
            if !set.insert(b).inserted {
                set.remove(b)
                count += 1
            }
            result[i] = count
        }
        return result
    }
    
    func tests() {
        print(findThePrefixCommonArray([1,3,2,4], [3,1,2,4])) // [0,2,3,4]
        print(findThePrefixCommonArray([2,3,1], [3,1,2])) // [0,1,3]
    }
}

