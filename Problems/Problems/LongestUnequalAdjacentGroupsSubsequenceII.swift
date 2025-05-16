final class LongestUnequalAdjacentGroupsSubsequenceII {
    func getWordsInLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        func check(_ s1: String, _ s2: String) -> Bool {
            guard s1.count == s2.count else { return false }
            var diff = 0
            for (c1, c2) in zip(s1, s2) where c1 != c2 {
                diff += 1
                if diff > 1 {
                    return false
                }
            }
            return diff == 1
        }
        let n = groups.count
        var dp: [Int] = Array(repeating: 1, count: n)
        var prev: [Int] = Array(repeating: -1, count: n)
        var maxIndex = 0
        for i in 1..<n {
            for j in 0..<i {
                if check(words[i], words[j]) && dp[j] + 1 > dp[i] && groups[i] != groups[j] {
                    dp[i] = dp[j] + 1
                    prev[i] = j
                }
            }
            if dp[i] > dp[maxIndex] {
                maxIndex = i
            }
        }
        var result: [String] = []
        var index = maxIndex
        while index >= 0 {
            result.append(words[index])
            index = prev[index]
        }
        return result.reversed()
    }

    func tests() {
        print(getWordsInLongestSubsequence(["bab","dab","cab"], [1,2,2])) // ["bab","cab"]
        print(getWordsInLongestSubsequence(["a","b","c","d"], [1,2,3,4])) // ["a","b","c","d"]
    }
}
