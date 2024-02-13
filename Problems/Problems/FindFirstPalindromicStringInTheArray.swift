class FindFirstPalindromicStringInTheArray {
    func firstPalindrome(_ words: [String]) -> String {
        func isPalindrome(str: String) -> Bool {
            guard str.count > 1 else { return true }
            var i = str.startIndex
            var j = str.endIndex
            while i < j {
                j = str.index(before: j)
                guard str[i] == str[j] else { return false }
                i = str.index(after: i)
            }
            return true
        }
        for str in words where isPalindrome(str: str) {
            return str
        }
        return ""
    }
    
    func tests() {
        print(firstPalindrome(["abc","car","ada","racecar","cool"])) // ada
        print(firstPalindrome(["notapalindrome","racecar"])) // racecar
        print(firstPalindrome(["def","ghi"])) // ""
    }
}

