final class MaximumNumberofWordsYouCanType {
    func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
        let brokenLetters = Set(Array(brokenLetters))
        let words = text.split(separator: " ")
        var result = words.count
        for word in words {
            for c in word where brokenLetters.contains(c) {
                result -= 1
                break
            }
        }
        return result
    }
    
    func tests() {
        print(canBeTypedWords("hello world", "ad")) // 1
        print(canBeTypedWords("leet code", "lt")) // 1
        print(canBeTypedWords("leet code", "e")) // 0
    }
}
