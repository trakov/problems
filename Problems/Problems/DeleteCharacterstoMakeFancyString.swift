class DeleteCharacterstoMakeFancyString {
    func makeFancyString(_ s: String) -> String {
        guard s.count > 2 else { return s }
        var result = ""
        var last = s.first!
        var count = 1
        result.append(last)
        for c in s.dropFirst() {
            if c != last {
                last = c
                count = 1
                result.append(c)
            } else if count != 2 {
                count += 1
                result.append(c)
            }
        }
        return result
    }
    
    func tests() {
        print(makeFancyString("leeetcode")) // "leetcode"
        print(makeFancyString("aaabaaaa")) // "aabaa"
        print(makeFancyString("aab")) // "aab"
    }
}

