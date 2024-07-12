class MaximumScoreFromRemovingSubstrings {
    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        if x < y {
            return maximumGain(String(s.reversed()), y, x)
        }
        let s = Array(s)
        var result = 0
        var aCount = 0
        var bCount = 0
        for c in s {
            if c == "a" {
                aCount += 1
            } else if c == "b" {
                if aCount > 0 {
                    aCount -= 1
                    result += x
                } else {
                    bCount += 1
                }
            } else {
                result += min(bCount, aCount) * y
                aCount = 0
                bCount = 0
            }
        }
        result += min(bCount, aCount) * y
        return result
    }
    
    func tests() {
        print(maximumGain("cdbcbbaaabab", 4, 5)) // 19
        print(maximumGain("aabbaaxybbaabb", 5, 4)) // 20
    }
}

