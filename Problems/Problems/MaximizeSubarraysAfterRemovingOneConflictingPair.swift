final class MaximizeSubarraysAfterRemovingOneConflictingPair {
    func maxSubarrays(_ n: Int, _ conflictingPairs: [[Int]]) -> Int {
        var bMin1 = Array(repeating: Int.max, count: n + 1)
        var bMin2 = Array(repeating: Int.max, count: n + 1)
        for pair in conflictingPairs {
            let a = min(pair[0], pair[1])
            let b = max(pair[0], pair[1])
            if bMin1[a] > b {
                bMin2[a] = bMin1[a]
                bMin1[a] = b
            } else if bMin2[a] > b {
                bMin2[a] = b
            }
        }
        var result = 0
        var ib1 = n
        var b2 = Int.max
        var delCount = Array(repeating: 0, count: n + 1)
        for i in (1...n).reversed() {
            if bMin1[ib1] > bMin1[i] {
                b2 = min(b2, bMin1[ib1])
                ib1 = i
            } else {
                b2 = min(b2, bMin1[i])
            }
            result += min(bMin1[ib1], n + 1) - i
            delCount[ib1]
            += min(b2, bMin2[ib1], n + 1)
            - min(bMin1[ib1], n + 1)
        }
        var maxVal = 0
        for val in delCount {
            maxVal = max(maxVal, val)
        }
        return result + maxVal
    }
    
    func tests() {
        print(maxSubarrays(4, [[2,3],[1,4]])) // 9
        print(maxSubarrays(5, [[1,2],[2,5],[3,5]])) // 12
    }
}
