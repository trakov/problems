final class StoneGameVIII {
    func stoneGameVIII(_ stones: [Int]) -> Int {
        var pre = stones
        for (i, s) in stones.enumerated().dropFirst() {
            pre[i] = pre[i - 1] + s
        }
        var f = pre
        for (i, p) in pre.enumerated().dropFirst().dropLast().reversed() {
            f[i] = max(f[i + 1], p - f[i + 1])
        }
        return f[1]
    }
    
    func tests() {
        print(stoneGameVIII([-1,2,-3,4,-5])) // 5
        print(stoneGameVIII([7,-6,5,10,5,-2,-6])) // 13
        print(stoneGameVIII([-10,-12])) // -22
    }
}
