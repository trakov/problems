class PathWithMinimumEffort {
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        let n = heights.count
        let m = heights[0].count
        var result = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        result[0][0] = 0
        func neighs(_ i: Int, _ j: Int) -> [(Int, Int)] {
            [(i - 1, j), (i + 1, j), (i, j - 1), (i, j + 1)].compactMap { (x, y) in
                guard x >= 0 && x < n && y >= 0 && y < m else { return nil }
                return (x, y)
            }
        }
        var queue = [(0, 0)]
        while !queue.isEmpty {
            let (i, j) = queue.removeFirst()
            for (x, y) in neighs(i, j) {
                let value = max(result[i][j], abs(heights[x][y] - heights[i][j]))
                if result[x][y] > value {
                    result[x][y] = value
                    queue.append((x, y))
                }
            }
        }
        return result[n - 1][m - 1]
    }
    
    func minimumEffortPath2(_ heights: [[Int]]) -> Int {
        let n = heights.count
        let m = heights[0].count
        guard n > 1 || m > 1 else { return 0 }
        var left = 0
        var right = 0
        guard n > 1 else {
            for (i, h) in heights[0].enumerated().dropFirst() {
                right = max(right, abs(h - heights[0][i - 1]))
            }
            return right
        }
        for i in 0..<n-1 {
            for j in 0..<m {
                right = max(right, abs(heights[i][j] - heights[i+1][j]))
                if j < m - 1 {
                    right = max(right, abs(heights[i][j] - heights[i][j+1]))
                }
            }
        }
        
        func neighs(_ i: Int, _ j: Int) -> [(Int, Int)] {
            [(i - 1, j), (i + 1, j), (i, j - 1), (i, j + 1)].compactMap { (x, y) in
                guard x >= 0 && x < n && y >= 0 && y < m else { return nil }
                return (x, y)
            }
        }
        
        func isPossible(_ effort: Int) -> Bool {
            var visited = heights
            var queue = [(0, 0)]
            visited[0][0] = 0
            while !queue.isEmpty {
                let q = queue.removeFirst()
                for (x, y) in neighs(q.0, q.1) where visited[x][y] > 0 {
                    guard abs(heights[q.0][q.1] - heights[x][y]) <= effort else {
                        continue
                    }
                    if x == n - 1 && y == m - 1 {
                        return true
                    }
                    queue.append((x, y))
                    visited[x][y] = 0
                }
            }
            return false
        }
        
        while left < right {
            let mid = left + (right - left) / 2
            if isPossible(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
    
    func tests() {
        print(minimumEffortPath([[3],[3],[7],[2],[9],[9],[3],[7],[10]])) // 7
        print(minimumEffortPath([[1,10,6,7,9,10,4,9]])) // 9
        print(minimumEffortPath([[1,2,2],[3,8,2],[5,3,5]])) // 2
        print(minimumEffortPath([[1,2,3],[3,8,4],[5,3,5]])) // 1
        print(minimumEffortPath(
            [[1,2,1,1,1],[1,2,1,2,1],[1,2,1,2,1],[1,2,1,2,1],[1,1,1,2,1]])) // 0
    }
}

