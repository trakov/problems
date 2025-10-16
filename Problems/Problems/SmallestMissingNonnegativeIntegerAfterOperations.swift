final class SmallestMissingNonnegativeIntegerAfterOperations {
    func findSmallestInteger(_ nums: [Int], _ value: Int) -> Int {
        var map: [Int: Int] = [:]
        for num in nums {
            map[(num % value + value) % value, default: 0] += 1
        }
        var (minCount, minNum) = (Int.max, Int.max)
        for i in 0..<value {
            guard let c = map[i] else { return i }
            if c < minCount {
                minCount = c
                minNum = i
            }
        }
        return minNum + minCount * value
    }
    
    func tests() {
        print(findSmallestInteger([1,-10,7,13,6,8], 5)) // 4
        print(findSmallestInteger([1,-10,7,13,6,8], 7)) // 2
        print(findSmallestInteger([0,-3], 4)) // 2
    }
}
