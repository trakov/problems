class CheckIfaWordOccursAsaPrefixofAnyWordinaSentence {
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        let words = sentence.split(separator: " ")
        for (i, word) in words.enumerated() where word.hasPrefix(searchWord) {
            return i + 1
        }
        return -1
    }
    
    func tests() {
        print(isPrefixOfWord("i love eating burger", "burg")) // 4
        print(isPrefixOfWord("this problem is an easy problem", "pro")) // 2
        print(isPrefixOfWord("i am tired", "you")) // -1
    }
}

