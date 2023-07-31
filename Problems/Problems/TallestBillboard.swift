class TallestBillboard {
    func tallestBillboard(_ rods: [Int]) -> Int {
        // diff between support heights : max support height for that diff
        var dp: [Int: Int] = [0: 0]
        var newDiff: Int, shorter: Int
        for rodHeight in rods {
            for (diff, taller) in dp {
                shorter = taller - diff
                newDiff = diff + rodHeight
                dp[newDiff] = max(taller + rodHeight, dp[newDiff] ?? Int.min)
                newDiff = abs(shorter + rodHeight - taller)
                dp[newDiff] = max(shorter + rodHeight, taller, dp[newDiff] ?? Int.min)
            }
        }
        return dp[0] ?? 0
    }

    func tests() {
        print(tallestBillboard([1,2,3,6])) // 6
        print(tallestBillboard([1,2,3,4,5,6])) // 10
        print(tallestBillboard([1,2])) // 0
    }
}

