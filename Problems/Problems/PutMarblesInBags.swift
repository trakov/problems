class PutMarblesInBags {
    func putMarbles(_ weights: [Int], _ k: Int) -> Int {
// We collect and sort the value of all n - 1 pairs.
        let n = weights.count
        var pairWeights = Array(repeating: 0, count: n - 1)
        for i in 0..<n-1 {
            pairWeights[i] = weights[i] + weights[i + 1]
        }
        pairWeights.sort()
// Get the difference between the largest k - 1 values and the
// smallest k - 1 values.
        var result = 0
        for i in 0..<k-1 {
            result += pairWeights[n - 2 - i] - pairWeights[i]
        }
        return result
    }
    // brute-force - TLE
    func putMarbles2(_ weights: [Int], _ k: Int) -> Int {
        guard k < weights.count else { return 0 }
        var maxScore = 0
        var minScore = Int.max
        
        func helper(score: Int, index: Int, count: Int) {
            if count == 1 {
                let temp = score + weights[index] + weights.last!
                maxScore = max(maxScore, temp)
                minScore = min(minScore, temp)
                return
            }
            for i in index...weights.count - count {
                helper(
                    score: score + weights[index] + weights[i],
                    index: i + 1,
                    count: count - 1
                )
            }
        }
        helper(score: 0, index: 0, count: k)
        return maxScore - minScore
    }
    
    func tests() {
        print(putMarbles([1,3,5,1], 2)) // 4
        print(putMarbles([1, 3], 2)) // 0
        print(putMarbles([1,4,2,5,2], 3)) // 3
    }
}

