import Foundation
class GreatestCommonDivisorOfStrings {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        guard str1.first == str2.first else { return "" }
        var n = str1.count
        var m = str2.count
        while n != 0, m != 0 {
            if n > m {
                n %= m
            } else {
                m %= n
            }
        }
        var gcd = n+m
        var temp = 2
        while gcd > 0 {
            let prefix = String(str1.prefix(gcd))
            if str1 == String(repeating: prefix, count:(str1.count/gcd))
                && str2 == String(repeating: prefix, count:(str2.count/gcd)) {
                return prefix
            } else if gcd >= temp {
                while gcd % temp != 0 {
                    temp += 1
                }
                gcd /= temp
            } else {
                break
            }
        }
        return ""
    }

    func tests() {
        print(gcdOfStrings("ABCDEF", "ABC")) // ""
        print(gcdOfStrings("ABCABC", "ABC")) // "ABC"
        print(gcdOfStrings("ABCABCABCABC", "ABC")) // "ABC"
        print(gcdOfStrings("ABCABCABCABC", "ABCABC")) // "ABCABC"
        print(gcdOfStrings("ABABAB", "ABAB")) // "AB"
        print(gcdOfStrings("LEET", "CODE")) // ""
        print(gcdOfStrings("TAUXXTAUXXTAUXXTAUXXTAUXX", "TAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXX"))
        // "TAUXX"
    }
}
