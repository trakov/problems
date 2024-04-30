class NumberofWonderfulSubstrings {
    func wonderfulSubstrings(_ word: String) -> Int {
        let n = word.count
        var freq: [Int: Int] = [0: 1]
        var mask = 0
        var result = 0
        for (i, c) in word.enumerated() {
            var bit = c.asciiValue! - Character("a").asciiValue!
            mask ^= (1 << bit)
            result += freq[mask, default: 0]
            freq[mask, default: 0] += 1
            for oddC in 0..<10 {
                result += freq[mask ^ (1 << oddC), default: 0]
            }
        }
        return result
    }
    
    func tests() {
        print(wonderfulSubstrings("aba")) // 4
        print(wonderfulSubstrings("aabb")) // 9
        print(wonderfulSubstrings("he")) // 2
    }
}

