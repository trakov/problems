final class MaximumDifferenceBetweenEvenandOddFrequencyI {
    func maxDifference(_ s: String) -> Int {
        var map: [Character: Int] = [:]
        for c in s {
            map[c, default: 0] += 1
        }
        var maxOddCount = Int.min
        var minEvenCount = Int.max
        for count in map.values {
            if count.isMultiple(of: 2) {
                minEvenCount = min(minEvenCount, count)
            } else {
                maxOddCount = max(maxOddCount, count)
            }
        }
        return maxOddCount - minEvenCount
    }
    
    func tests() {
        print(maxDifference("aaaaabbc")) // 3
        print(maxDifference("abcabcab")) // 1
        
    }
}
