class RepeatedDNASequences {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count > 10 else { return [] }
        var all: Set<Substring> = []
        var result: Set<String> = []
        var i = s.index(s.startIndex, offsetBy: 9)
        while i < s.endIndex {
            let temp = s[s.index(i, offsetBy: -9)...i]
            if !all.insert(temp).inserted {
                result.insert(String(temp))
            }
            i = s.index(after: i)
        }
        
        return Array(result)
    }
    
    func tests() {
        print(findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))
        // ["AAAAACCCCC","CCCCCAAAAA"]
        print(findRepeatedDnaSequences("AAAAAAAAAAAAA"))
        // ["AAAAAAAAAA"]
    }
}

