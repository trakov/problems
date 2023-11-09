class CountNumberOfHomogenousSubstrings {
    func countHomogenous(_ s: String) -> Int {
        guard s.count > 1 else { return 1 }
        let mod = 1_000_000_007
        var result = 0
        var count = 0
        let s = Array(s)
        for (i, c) in s.enumerated() {
            if i == 0 || s[i - 1] == c {
                count += 1
            } else {
                count = 1
            }
            result = (result + count) % mod
        }
        return result
    }
    
    func tests() {
        print(countHomogenous("abbcccaa")) // 13
        print(countHomogenous("xy")) // 2
        print(countHomogenous("zzzzz")) // 15
    }
}

