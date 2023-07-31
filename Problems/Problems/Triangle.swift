class Triangle {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 1 else { return triangle[0][0] }
        var dp = triangle.last!
        for i in (0..<triangle.count-1).reversed() {
            for j in 0..<triangle[i].count {
                dp[j] = min(dp[j], dp[j+1]) + triangle[i][j]
            }
        }
        return dp[0]
    }

    func tests() {
        print(minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]])) // 11
        print(minimumTotal([[-10]])) // -10
    }
}
