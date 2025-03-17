class DivideArrayIntoEqualPairs {
    func divideArray(_ nums: [Int]) -> Bool {
        var set: Set<Int> = []
        for num in nums {
            if !set.insert(num).inserted {
                set.remove(num)
            }
        }
        return set.isEmpty
    }
    
    func tests() {
        print(divideArray([3,2,3,2,2,2])) // true
        print(divideArray([1,2,3,4])) // false
    }
}

