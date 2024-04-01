class LengthOfLastWord {
    func lengthOfLastWord(_ s: String) -> Int {
        var result = 0
        for c in s.reversed() {
            if c != " " {
                result += 1
            } else if result > 0 {
                return result
            }
        }
        return result
    }

    func lengthOfLastWord0(_ s: String) -> Int {
        var result = 0
        var i = s.endIndex
        while i > s.startIndex {
            i = s.index(before: i)
            while s[i] != " " {
                result += 1
                guard i > s.startIndex else { break }
                i = s.index(before: i)
            }
            if result == 0 {
                continue
            } else {
                return result
            }
        }
        return result
    }

    func lengthOfLastWord2(_ s: String) -> Int {
        s.split(separator: " ").last?.count ?? 0
    }

    func tests() {
        print(lengthOfLastWord("Hello World")) // 5
        print(lengthOfLastWord("   fly me   to   the moon  ")) // 4
        print(lengthOfLastWord("")) // 0
        print(lengthOfLastWord("   ")) // 0
        print(lengthOfLastWord("   w ")) // 1
        print(lengthOfLastWord("w")) // 1
    }
}
