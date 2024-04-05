class MakeTheStringGreat {
    func makeGood(_ s: String) -> String {
        var result: [Character] = []
        for c in s {
            if let last = result.last,
               last.uppercased() == c.uppercased(),
               last.isUppercase != c.isUppercase {
                result.removeLast()
            } else {
                result.append(c)
            }
        }
        return String(result)
    }
    
    func tests() {
        print(makeGood("leEeetcode")) // leetcode
        print(makeGood("abBAcC")) // ""
        print(makeGood("s")) // s
    }
}

