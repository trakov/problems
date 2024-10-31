class MinimumTotalDistanceTraveled {
    func minimumTotalDistance(_ robot: [Int], _ factory: [[Int]]) -> Int {
        var robots = robot.sorted()
        var factories = factory.sorted { $0[0] < $1[0] }
        
        let m = robots.count
        let n = factories.count
        
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        for i in 0..<m {
            dp[i][n] = Int.max
        }
        
        for j in stride(from: n-1, through: 0, by: -1) {
            var prefix = 0
            var queue = [(Int, Int)]()
            queue.append((m, 0))
            
            for i in stride(from: m-1, through: 0, by: -1) {
                prefix += abs(robots[i] - factories[j][0])
                
                while !queue.isEmpty && queue[0].0 > i + factories[j][1] {
                    queue.removeFirst()
                }
                
                while !queue.isEmpty && queue.last!.1 >= dp[i][j+1] - prefix {
                    queue.removeLast()
                }
                
                queue.append((i, dp[i][j+1] - prefix))
                dp[i][j] = queue[0].1 + prefix
            }
        }
        
        return dp[0][0]
    }
    
    func tests() {
        print(minimumTotalDistance([0,4,6], [[2,2],[6,2]])) // 4
        print(minimumTotalDistance([1,-1], [[-2,1],[2,1]])) // 2
    }
}

