class ReverseVowelsOfAString {
    func reverseVowels(_ s: String) -> String {
        func isVowel(c: Character) -> Bool {
            let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
            return vowels.contains(c)
        }
        var result = Array(s)
        
        var left = 0
        var right = result.count - 1
        while left < right {
            if !isVowel(c: result[left]) {
                left += 1
            }
            if !isVowel(c: result[right]) {
                right -= 1
            }
            if isVowel(c: result[left]) && isVowel(c: result[right]) {
                result.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        
        return String(result)
    }

    func tests() {
        print(reverseVowels("eo")) // oe
        print(reverseVowels("o")) // o
        print(reverseVowels("teo")) // toe
        print(reverseVowels("hello")) // holle
        print(reverseVowels("leetcode")) // leotcede
    }
}
