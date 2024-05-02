class LargestPositiveIntegerThatExistsWithItsNegative {
    func findMaxK(_ nums: [Int]) -> Int {
        var result = -1
        var set: Set<Int> = []
        for num in nums {
            if set.contains(-num) {
                result = max(result, abs(num))
            }
            set.insert(num)
        }
        return result
    }
    
    func tests() {
        print(findMaxK([-1,2,-3,3])) // 3
        print(findMaxK([-1,10,6,7,-7,1])) // 7
        print(findMaxK([-10,8,6,7,-2,-3])) // -1
    }
}

