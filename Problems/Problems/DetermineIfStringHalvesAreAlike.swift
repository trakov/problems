import Foundation
class DetermineIfStringHalvesAreAlike {
    func halvesAreAlike(_ s: String) -> Bool {
        let n = s.count
        let vowels = Set(["a", "e", "i", "o", "u"])
        var count = 0
        for (i, c) in s.enumerated() where vowels.contains(c.lowercased()) {
            count += i < n / 2 ? 1 : -1
        }
        return count == 0
    }
    
    func halvesAreAlike1(_ s: String) -> Bool {
        let vowels = "aeiou"
        let a = s.suffix(s.count / 2).lowercased().filter(vowels.contains)
        let b = s.prefix(s.count / 2).lowercased().filter(vowels.contains)
        return a.count == b.count
    }

    func undexSolution(_ s: String) -> Bool {
        let vowels = ["a", "e", "i", "o", "u"]
        var start = s.startIndex
        var end = s.index(before: s.endIndex)
        var aCount = 0
        var bCount = 0
        while start < end {
            aCount += vowels.contains(s[start].lowercased()) ? 1 : 0
            bCount += vowels.contains(s[end].lowercased()) ? 1 : 0
            start = s.index(after: start)
            end = s.index(before: end)
        }
        
        return aCount == bCount
    }
    
    func tests() {
        print(halvesAreAlike("auBEokhoeIouuPFRalobaAgtealGVeaIIoFMoUIoKwoLRI")) // false
        print(halvesAreAlike("book")) // true
        print(halvesAreAlike("textbook")) // false
    }
}
