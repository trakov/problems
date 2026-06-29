final class NumberofStringsThatAppearasSubstringsinWord {
    func numOfStrings(_ patterns: [String], _ word: String) -> Int {
        patterns.count { word.contains($0) }
    }
    
    func tests() {
        print(numOfStrings(["a","abc","bc","d"], "abc")) // 3
        print(numOfStrings(["a","b","c"], "aaaaabbbbb")) // 2
        print(numOfStrings(["a","a","a"], "ab")) // 3
    }
}
