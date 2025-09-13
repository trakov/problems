final class FindMostFrequentVowelandConsonant {
    func maxFreqSum(_ s: String) -> Int {
        var map: [Character: Int] = [:]
        var (maxV, maxC) = (0, 0)
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        for c in s {
            map[c, default: 0] += 1
            if vowels.contains(c) {
                maxV = max(maxV, map[c]!)
            } else {
                maxC = max(maxC, map[c]!)
            }
        }
        return maxV + maxC
    }
    
    func tests() {
        print(maxFreqSum("successes")) // 6
        print(maxFreqSum("aeiaeia")) // 3
    }
}
