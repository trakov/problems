final class LongestHarmoniousSubsequence {
    func findLHS(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        var result = 0
        for (num, count) in map {
            if let nextCount = map[num + 1] {
                result = max(result, count + nextCount)
            }
        }
        return result
    }
    
    func tests() {
        print(findLHS([1,3,2,2,5,2,3,7])) // 5
        print(findLHS([1,2,3,4])) // 2
        print(findLHS([1,1,1,1])) // 0
    }
}
