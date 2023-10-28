class CountVowelsPermutation {
    func countVowelPermutation(_ n: Int) -> Int {
        let mod = 1_000_000_007
        var a = 1, e = 1, i = 1, o = 1, u = 1
        for _ in 0..<n-1 {
            (a, e, i, o, u) = ((e + i + u) % mod, (a + i) % mod, (e + o) % mod, i, (i + o) % mod)
        }
        return (a + e + i + o + u) % mod
    }

    func countVowelPermutation2(_ n: Int) -> Int {
        let rules = [0: [1], 1: [0, 2], 2: [0, 1, 3, 4], 3: [2, 4], 4: [0]]
        let mod = 1_000_000_007
        var result = Array(repeating: 1, count: 5)
        for _ in 0..<n-1 {
            var temp = Array(repeating: 0, count: 5)
            for (key, values) in rules {
                for value in values {
                    temp[value] = (temp[value] + result[key]) % mod
                }
            }
            result = temp
        }
        return result.reduce(0, +) % mod
    }
    
    func tests() {
        print(countVowelPermutation(1)) // 5
        print(countVowelPermutation(2)) // 10
        print(countVowelPermutation(5)) // 68
        print(countVowelPermutation(144)) // 18208803
    }
}

