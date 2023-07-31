class MissingNumber {
    func missingNumber(_ nums: [Int]) -> Int {
        var result = nums.count
        for (i, num) in nums.enumerated() {
            result += i - num
        }
        return result
    }

    func sumSolution(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, +)
        let expectedSum = (0...nums.count).reduce(0, +)
        return expectedSum - sum
    }
    
    func sortedSolution(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        for i in 0..<sorted.count {
            if i != sorted[i] {
                return i
            }
        }
        return nums.count
    }
    
    func tests() {
        print(missingNumber([3,0,1])) // 2
        print(missingNumber([0,1])) // 2
        print(missingNumber([9,6,4,2,3,5,7,0,1])) // 8

    }
}
