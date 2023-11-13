class SortVowelsInAString {
    func sortVowels(_ s: String) -> String {
        var result = Array(s)
        let allVowels: Set<Character> = ["A", "E", "I", "O", "U", "a", "e", "i", "o", "u"]
        let vowels: [Character] = result
            .filter { allVowels.contains($0) }
            .sorted()
        guard vowels.count > 1 else { return String(result) }
        var j = 0
        for (i, c) in result.enumerated() {
            guard allVowels.contains(c) else { continue }
            result[i] = vowels[j]
            j += 1
        }
        return String(result)
    }
    
    func tests() {
        print(sortVowels("lEetcOde")) // lEOtcede
        print(sortVowels("lYmpH")) // lYmpH
    }
}

