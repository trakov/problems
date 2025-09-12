final class VowelsGameinaString {
    func doesAliceWin(_ s: String) -> Bool {
        let set = Set(Array("aeiou"))
        return s.contains { c in
            set.contains(c)
        }
    }
    
    func tests() {
        print(doesAliceWin("leetcoder")) // true
        print(doesAliceWin("bbcd")) // false
    }
}
