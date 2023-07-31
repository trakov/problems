class MergeStringsAlternately {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var result = ""
        var i = word1.startIndex
        while i < min(word1.endIndex, word2.endIndex) {
            result += word1[i...i] + word2[i...i]
            i = word1.index(after: i)
        }
        if word1.count == word2.count {
            return result
        } else if word1.count < word2.count {
            return result + word2.suffix(from: i)
        } else {
            return result + word1.suffix(from: i)
        }
    }

    func tests() {
        print(mergeAlternately("abc", "pqr")) // "apbqcr"
        print(mergeAlternately("ab", "pqrs")) // "apbqrs"
        print(mergeAlternately("abcd", "pq")) // "apbqcd"
    }
}
