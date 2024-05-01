class ReversePrefixofWord {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        var word = Array(word)
        var index = 0
        for (i, c) in word.enumerated() where c == ch {
            index = i
            break
        }
        guard index != 0 else { return String(word) }
        var i = 0
        while i < index {
            word.swapAt(i, index)
            i += 1
            index -= 1
        }
        return String(word)
    }
    
    func tests() {
        print(reversePrefix("abcdefd", "d")) // dcbaefd
        print(reversePrefix("xyxzxe", "z")) // zxyxxe
        print(reversePrefix("abcd", "z")) // abcd
    }
}

