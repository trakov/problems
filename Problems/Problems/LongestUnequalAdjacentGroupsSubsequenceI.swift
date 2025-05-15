final class LongestUnequalAdjacentGroupsSubsequenceI {
    func getLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        var result: [String] = []
        var g = -1
        for (word, group) in zip(words, groups) where group != g {
            result.append(word)
            g = group
        }
        return result
    }
    
    func tests() {
        print(getLongestSubsequence(["e"], [0])) // ["e"]
        print(getLongestSubsequence(["e","a","b"], [0,0,1])) // ["e","b"]
        print(getLongestSubsequence(["a","b","c","d"], [1,0,1,1])) // ["a","b","c"]
    }
}
