final class CountEqualandDivisiblePairsinanArray {
    func countPairs(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        for (i, first) in nums.enumerated().dropLast() {
            for (j, second) in nums.enumerated().dropFirst(i + 1) {
                if first == second, i * j % k == 0 {
                    result += 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(countPairs([3,1,2,2,2,1,3], 2)) // 4
        print(countPairs([1,2,3,4], 1)) // 0
    }
}
