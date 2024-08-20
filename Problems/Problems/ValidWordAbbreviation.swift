class ValidWordAbbreviation {
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        let word = Array(word)
        let abbr = Array(abbr)
        var count = 0
        var j = 0
        for (i, c) in abbr.enumerated() {
            if let num = c.wholeNumberValue {
                if num == 0 && count == 0 { return false }
                count = count * 10 + num
            } else {
                j += count
                guard j < word.count else { return false }
                guard c == word[j] else { return false }
                count = 0
                j += 1
            }
        }
        return word.count - j == count
    }
    
    func tests() {
        print(validWordAbbreviation("internationalization", "i12iz4n")) // true
        print(validWordAbbreviation("apple", "a2e")) // false
    }
}

