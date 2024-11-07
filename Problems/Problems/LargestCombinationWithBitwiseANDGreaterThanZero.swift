class LargestCombinationWithBitwiseANDGreaterThanZero {
    func largestCombination(_ candidates: [Int]) -> Int {
        var maxCount = 0
        for i in 0..<24 {
            var count = 0
            for num in candidates {
                if (num & (1 << i)) != 0 {
                    count += 1
                }
            }
            maxCount = max(maxCount, count)
        }
        return maxCount
    }
    
    func tests() {
        print(largestCombination([16,17,71,62,12,24,14])) // 4
        print(largestCombination([8,8])) // 2
    }
}

