final class FindtheMaximumNumberofFruitsCollected {
    func maxCollectedFruits(_ fruits: [[Int]]) -> Int {
        let n = fruits.count
        var result = 0
        for i in 0..<n {
            result += fruits[i][i]
        }
        var fruits = fruits
        func dp() -> Int {
            var prev = Array(repeating: Int.min, count: n)
            var curr = Array(repeating: Int.min, count: n)
            prev[n - 1] = fruits[0][n - 1]
            for i in 1..<n-1 {
                for j in max(n - 1 - i, i + 1)..<n {
                    var best = prev[j]
                    if j - 1 >= 0 {
                        best = max(best, prev[j - 1])
                    }
                    if j + 1 < n {
                        best = max(best, prev[j + 1])
                    }
                    curr[j] = best + fruits[i][j]
                }
                (prev, curr) = (curr, prev)
            }
            return prev[n - 1]
        }
        result += dp()
        for i in 0..<n {
            for j in 0..<i {
                (fruits[j][i], fruits[i][j]) = (fruits[i][j], fruits[j][i])
            }
        }
        result += dp()
        return result
    }
    
    func tests() {
        print(maxCollectedFruits([[1,2,3,4],[5,6,8,7],[9,10,11,12],[13,14,15,16]]))
        // 100
        print(maxCollectedFruits([[1,1],[1,1]]))
        // 4
    }
}
