import Foundation
class ValidPalindrome {
    func isPalindrome(_ s: String) -> Bool {
        let preparedS = s.lowercased().components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        return preparedS == String(preparedS.reversed())
    }

    func tests() {
        print(isPalindrome("A man, a plan, a canal: Panama")) // true
        print(isPalindrome("race a car")) // false
        print(isPalindrome(" ")) // true
    }
}
