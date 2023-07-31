class FindTheIndexOfTheFirstOccurrenceInAString {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else { return -1 }
        var haystack = Array(haystack)
        var needle = Array(needle)
        var i = 0
        while i < haystack.count - needle.count + 1 {
            if haystack[i] == needle[0] {
                if Array(haystack[i..<i+needle.count]) == needle {
                    return i
                }
            }
            i += 1
        }
        return -1
    }

    func tests() {
        print(strStr("a", "a"))
        print(strStr("sadbutsad", "sad")) // 0
        print(strStr("leetcode", "leeto")) // -1
    }
}
