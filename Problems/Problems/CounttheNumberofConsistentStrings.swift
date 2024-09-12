class CounttheNumberofConsistentStrings {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        let set = Set(allowed)
        var result = 0
        for word in words {
            var consistent = true
            for c in word where !set.contains(c) {
                consistent = false
                break
            }
            result += consistent ? 1 : 0
        }
        return result
    }
    
    func tests() {
        print(countConsistentStrings("ab", ["ad","bd","aaab","baa","badab"])) // 2
        print(countConsistentStrings("abc", ["a","b","c","ab","ac","bc","abc"])) // 7
        print(countConsistentStrings("cad", ["cc","acd","b","ba","bac","bad","ac","d"])) // 4
    }
}

