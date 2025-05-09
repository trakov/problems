final class CountNumberofBalancedPermutations {
    func countBalancedPermutations(_ num: String) -> Int {
        let mod = 1_000_000_007
        var tot = 0
        let n = num.count
        var cnt = Array(repeating: 0, count: 10)
        for c in num {
            let d = Int(String(c))!
            cnt[d] += 1
            tot += d
        }
        guard tot % 2 == 0 else { return 0 }
        let target = tot / 2
        let maxOdd = (n + 1) / 2
        var comb = Array(repeating: Array(repeating: 0, count: maxOdd + 1), count: maxOdd + 1)
        var f = Array(repeating: Array(repeating: 0, count: maxOdd + 1), count: target + 1)
        for i in 0...maxOdd {
            comb[i][i] = 1
            comb[i][0] = 1
            guard i > 1 else { continue }
            for j in 1..<i {
                comb[i][j] = (comb[i - 1][j] + comb[i - 1][j - 1]) % mod
            }
        }
        f[0][0] = 1
        var (psum, totSum) = (0, 0)
        for i in 0...9 {
            psum += cnt[i]
            totSum += i * cnt[i]
            for oddCnt in (max(0, psum - (n - maxOdd))...min(psum, maxOdd)).reversed() {
                let evenCnt = psum - oddCnt
                for curr in (max(0, totSum - target)...min(totSum, target)).reversed() {
                    var res = 0
                    for j in max(0, cnt[i] - evenCnt)...min(cnt[i], oddCnt) where i * j <= curr {
                        let ways = (comb[oddCnt][j] * comb[evenCnt][cnt[i] - j]) % mod
                        res = (res + ((ways * f[curr - i * j][oddCnt - j]) % mod)) % mod
                    }
                    f[curr][oddCnt] = res % mod
                }
            }
        }
        return f[target][maxOdd]
    }
    
    func tests() {
        print(countBalancedPermutations("123")) // 2
        print(countBalancedPermutations("112")) // 1
        print(countBalancedPermutations("12345")) // 0
    }
}
