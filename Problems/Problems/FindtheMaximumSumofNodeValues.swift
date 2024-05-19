class FindtheMaximumSumofNodeValues {
    func maximumValueSum(_ nums: [Int], _ k: Int, _ edges: [[Int]]) -> Int {
        var minPosDiff = Int.max
        var maxNegDiff = Int.min
        var count = 0
        var result = 0
        for num in nums {
            let xor = num ^ k
            if xor > num {
                result += xor
                minPosDiff = min(minPosDiff, xor - num)
                count += 1
            } else {
                result += num
                maxNegDiff = max(maxNegDiff, xor - num)
            }
        }
        if count % 2 == 1 {
            result += max(-minPosDiff, maxNegDiff)
        }
        return result
    }
    
    func tests() {
        print(maximumValueSum([1,2,1], 3, [[0,1],[0,2]])) // 6
        print(maximumValueSum([2,3], 7, [[0,1]])) // 9
        print(maximumValueSum(
            [7,7,7,7,7,7], 3, [[0,1],[0,2],[0,3],[0,4],[0,5]]
        )) // 42
        print(maximumValueSum([24,78,1,97,44], 6, [[0,2],[1,2],[4,2],[3,4]])) // 260
    }
}

