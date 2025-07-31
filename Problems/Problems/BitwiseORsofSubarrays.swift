final class BitwiseORsofSubarrays {
    func subarrayBitwiseORs(_ arr: [Int]) -> Int {
        var result: Set<Int> = []
        var cur = Set([0])
        for num in arr {
            var cur2: Set<Int> = []
            for c in cur {
                cur2.insert(c | num)
            }
            cur2.insert(num)
            cur = cur2
            result.formUnion(cur)
        }
        return result.count
    }
    
    func tests() {
        print(subarrayBitwiseORs([0])) // 1
        print(subarrayBitwiseORs([1,1,2])) // 3
        print(subarrayBitwiseORs([1,2,4])) // 6
    }
}
