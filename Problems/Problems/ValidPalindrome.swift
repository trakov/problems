import Foundation

extension Character {
    var isAlphaNumeric: Bool {
        isLetter || isNumber
    }
}

class ValidPalindrome {
    func isPalindrome(_ s: String) -> Bool {
        let s = Array(s)
        var left = 0
        var right = s.count - 1
        while left < right {
            let first = s[left]
            let last = s[right]
            guard first.isAlphaNumeric else { left += 1; continue }
            guard last.isAlphaNumeric else { right -= 1; continue }
            guard first.lowercased() == last.lowercased() else { return false }
            left += 1
            right -= 1
        }
        return true
    }
    
    func isPalindrome1(_ s: String) -> Bool {
        var str: [Character] = s.compactMap {
            guard $0.isLetter || $0.isNumber else { return nil }
            return Character($0.lowercased())
        }
        var left = 0
        var right = str.count - 1
        while left < right {
            guard str[left] == str[right] else { return false }
            left += 1
            right -= 1
        }
        return true
    }

    func isPalindrome2(_ s: String) -> Bool {
        let preparedS = s.lowercased().components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        return preparedS == String(preparedS.reversed())
    }

    func tests() {
        print(isPalindrome("A man, a plan, a canal: Panama")) // true
        print(isPalindrome("race a car")) // false
        print(isPalindrome(" ")) // true
    }
}
