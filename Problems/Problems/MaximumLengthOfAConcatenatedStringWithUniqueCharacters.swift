class MaximumLengthOfAConcatenatedStringWithUniqueCharacters {
    func maxLength(_ arr: [String]) -> Int {
        var dp: [Int] = [0]
        var result = 0
        for s in arr {
            var a = 0
            var dup = 0
            for c in s {
                let diff = (c.asciiValue! - Character("a").asciiValue!)
                dup |= a & (1 << diff)
                a |= 1 << diff
            }
            guard dup <= 0 else { continue }
            for i in (0..<dp.count).reversed() {
                if dp[i] & a > 0 {
                    continue
                }
                dp.append(dp[i] | a)
                result = max(result, (dp[i] | a).nonzeroBitCount)
            }
        }
        return result
    }
    
    func tests() {
        print(maxLength(["un","iq","ue"])) // 4
        print(maxLength(["cha","r","act","ers"])) // 6
        print(maxLength(["abcdefghijklmnopqrstuvwxyz"])) // 26
    }
}

