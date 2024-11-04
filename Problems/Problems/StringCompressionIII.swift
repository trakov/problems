class StringCompressionIII {
    func compressedString(_ word: String) -> String {
        guard !word.isEmpty else { return word }
        var result = ""
        var count = 1
        var char = word.first!
        for c in (word + "#").dropFirst() {
            if c != char {
                while count > 9 {
                    result += "\(9)\(char)"
                    count -= 9
                }
                result += "\(count)\(char)"
                count = 1
                char = c
            } else {
                count += 1
            }
        }
        return result
    }
    
    func tests() {
        print(compressedString("abcde")) // "1a1b1c1d1e"
        print(compressedString("aaaaaaaaaaaaaabb")) // "9a5a2b"
    }
}

