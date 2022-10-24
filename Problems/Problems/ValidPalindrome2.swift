import Foundation
class ValidPalindrome2 {
    
    func isPalindrome(_ s: String) -> Bool {
        guard s.count > 2 else { return true }
        if !isPalindrome(s, useLeftStrategy: true) {
            return isPalindrome(s, useLeftStrategy: false)
        }
        return true
    }
    
    func isPalindrome(_ s: String, useLeftStrategy: Bool) -> Bool {
        var leftDeletedIndex: String.Index?
        var rightDeletedIndex: String.Index?
        var i = s.startIndex
        var j = s.index(before: s.endIndex)
        
        while i <= j {
            if s[i] == s[j] {
                i = s.index(after: i)
                j = s.index(before: j)
            } else if useLeftStrategy {
                if s[s.index(after: i)] == s[j] && leftDeletedIndex == nil && rightDeletedIndex == nil {
                    i = s.index(after: i)
                    leftDeletedIndex = i
                } else if s[i] == s[s.index(before: j)] && leftDeletedIndex == nil && rightDeletedIndex == nil {
                    j = s.index(before: j)
                    rightDeletedIndex = j
                } else {
                    return false
                }
            } else {
                if s[i] == s[s.index(before: j)] && leftDeletedIndex == nil && rightDeletedIndex == nil {
                    j = s.index(before: j)
                    rightDeletedIndex = j
                } else if s[s.index(after: i)] == s[j] && leftDeletedIndex == nil && rightDeletedIndex == nil {
                    i = s.index(after: i)
                    leftDeletedIndex = i
                } else {
                    return false
                }
            }
        }
        return true
    }

    func tests() {
//        print(isPalindrome(
//            "cuucu"
//        ))
        print(isPalindrome(
            "aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga"
           //                   Cup                                                           U
        ))
        print(isPalindrome("eeccccbebaeeabebccceea")) // false
        print(isPalindrome("aba")) // true
        print(isPalindrome("abca")) // true
        print(isPalindrome("abc")) // false
        print(isPalindrome("abcb")) // true
        print(isPalindrome("abac")) // true
        print(isPalindrome("abbb")) // true
        print(isPalindrome("abcba")) // true
        print(isPalindrome("abcca")) // true
        print(isPalindrome("abccb")) // true
        print(isPalindrome("abbca")) // true
    }
}
