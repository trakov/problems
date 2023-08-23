class ReorganizeString {
    func reorganizeString(_ s: String) -> String {
        let n = s.count
        guard n > 1 else { return s }
        let map = s.reduce(into: [Character: Int]()) {
            $0[$1, default: 0] += 1
        }.sorted { $0.value > $1.value }
        guard map.first!.value <= n / 2 + n % 2 else { return "" }
        var result = Array(repeating: Character("#"), count: n)
        
        var i = 0
        for (_, (char, count)) in map.enumerated() {
            for _ in 0..<count {
                result[i] = char
                i += 2
                if i >= n { i = 1 }
            }
        }
        
        return String(result)
    }
    
    func tests() {
        print(reorganizeString("aab")) // "aba"
        print(reorganizeString("aaab")) // ""
    }
}

