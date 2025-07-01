final class FindtheOriginalTypedStringI {
    func possibleStringCount(_ word: String) -> Int {
        var result = 0
        var c = 1
        var last = word.first
        for w in (word + "*").dropFirst() {
            if w == last {
                c += 1
            } else {
                result += c
                c = 0
                last = w
            }
        }
        return result
    }
    
    func tests() {
        print(possibleStringCount("abbcccc")) // 5
        print(possibleStringCount("abcd")) // 1
        print(possibleStringCount("aaaa")) // 4
    }
}
