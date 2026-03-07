final class MinimumNumberofFlipsMaketheBinaryStringAlternating {
    func minFlips(_ s: String) -> Int {
        let n = s.count
        var pre = Array(repeating: [0, 0], count: n)
        for (i, c) in s.enumerated() {
            pre[i][0] = (i == 0 ? 0 : pre[i - 1][1]) + (c == "1" ? 1 : 0)
            pre[i][1] = (i == 0 ? 0 : pre[i - 1][0]) + (c == "0" ? 1 : 0)
        }
        var result = min(pre[n - 1][0], pre[n - 1][1])
        if n % 2 == 1 {
            var suf = Array(repeating: [0, 0], count: n)
            for (i, c) in s.enumerated().reversed() {
                suf[i][0] =
                    (i == n - 1 ? 0 : suf[i + 1][1]) + (c == "1" ? 1 : 0);
                suf[i][1] =
                    (i == n - 1 ? 0 : suf[i + 1][0]) + (c == "0" ? 1 : 0);
            }
            for i in 0..<n-1 {
                result = min(result, pre[i][0] + suf[i + 1][0])
                result = min(result, pre[i][1] + suf[i + 1][1])
            }
        }
        return result
    }
    
    func tests() {
        print(minFlips("111000")) // 2
        print(minFlips("010")) // 0
        print(minFlips("1110")) // 1
    }
}
