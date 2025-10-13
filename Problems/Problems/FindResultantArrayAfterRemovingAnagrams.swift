final class FindResultantArrayAfterRemovingAnagrams {
    func removeAnagrams(_ words: [String]) -> [String] {
        func anagram(_ word: String) -> [Int] {
            var a = Array(repeating: 0, count: 26)
            for c in word {
                a[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
            }
            return a
        }
        var result: [String] = [words[0]]
        var a = anagram(words[0])
        for word in words.dropFirst() {
            let wa = anagram(word)
            if a != wa {
                result.append(word)
                a = wa
            }
        }
        return result
    }
    
    func tests() {
        print(removeAnagrams(["abba","baba","bbaa","cd","cd"])) // ["abba","cd"]
        print(removeAnagrams(["a","b","c","d","e"])) // ["a","b","c","d","e"]
    }
}
