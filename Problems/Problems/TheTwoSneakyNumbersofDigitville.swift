final class TheTwoSneakyNumbersofDigitville {
    func getSneakyNumbers(_ nums: [Int]) -> [Int] {
        var result: [Int] = []
        var set: Set<Int> = []
        for num in nums {
            if !set.insert(num).inserted {
                result.append(num)
            }
        }
        return result
    }
    
    func tests() {
        print(getSneakyNumbers([0,1,1,0])) // [0,1]
        print(getSneakyNumbers([0,3,2,1,3,2])) // [2,3]
        print(getSneakyNumbers([7,1,5,4,3,4,6,0,9,5,8,2])) // [4,5]
    }
}
