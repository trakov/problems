class MaximumNumberOfVowelsInASubstringOfGivenLength {
    private let vowels: Set<Character> = Set(["a", "e", "i", "o", "u"])

    func maxVowels(_ s: String, _ k: Int) -> Int {
        var s = Array(s)
        var result = 0
        var count = 0
        for i in 0..<s.count {
            if i < k {
                count += isVowel(c: s[i]) ? 1 : 0
                result = count
            } else {
                count += (isVowel(c: s[i]) ? 1 : 0) - (isVowel(c: s[i-k]) ? 1 : 0)
                result = max(result, count)
            }
        }
        return result
    }
    
    private func isVowel(c: Character) -> Bool {
        vowels.contains(c)
    }
    
    func tests() {
        print(maxVowels("abciiidef", 3)) // 3
        print(maxVowels("aeiou", 2)) // 2
        print(maxVowels("leetcode", 3)) // 2
    }
}
