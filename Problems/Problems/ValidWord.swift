final class ValidWord {
    func isValid(_ word: String) -> Bool {
        guard word.count >= 3 else { return false }
        var hasVowel = false
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        var hasConsonant = false
        for char in word.lowercased() {
            guard char.isLetter || char.isNumber else { return false }
            guard char.isLetter else { continue }
            if vowels.contains(char) {
                hasVowel = true
            } else {
                hasConsonant = true
            }
        }
        return hasVowel && hasConsonant
    }
    
    func tests() {
        print(isValid("234Adas")) // true
        print(isValid("b3")) // false
        print(isValid("a3$e")) // false
    }
}
