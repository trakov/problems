class DetectCapital {
    func detectCapitalUse(_ word: String) -> Bool {
        guard word.count > 1 else { return true }
        var word = Array(word)
        let mustBeLower = word[0].isLowercase
        let mustBeUpper = word[1].isUppercase
        if mustBeLower && mustBeUpper { return false }
        guard word.count > 2 else { return true }
        for w in word.dropFirst(2) {
            if w.isLowercase && mustBeLower {
                continue
            }
            if w.isLowercase && !mustBeLower && !mustBeUpper {
                continue
            }
            if w.isUppercase && !mustBeLower && mustBeUpper {
                continue
            }
            return false
        }
        return true
    }
    
    func detectCapitalUse2(_ word: String) -> Bool {
        if word == word.capitalized { return true }
        if word == word.uppercased() { return true }
        if word == word.lowercased() { return true }
        return false
    }

    func tests() {
        print(detectCapitalUse("FFFf")) // false
        print(detectCapitalUse("USA")) // true
        print(detectCapitalUse("FlaG")) // false
        print(detectCapitalUse("Google")) // true
        print(detectCapitalUse("leetcode")) // true
    }
}
