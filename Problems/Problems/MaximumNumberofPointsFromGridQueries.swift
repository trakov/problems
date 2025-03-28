import HeapModule

class MaximumNumberofPointsFromGridQueries {
    struct Val: Comparable {
        let val: Int
        let x: Int
        let y: Int
        static func < (lhs: Val, rhs: Val) -> Bool {
            lhs.val < rhs.val
        }
    }
    func maxPoints(_ grid: [[Int]], _ queries: [Int]) -> [Int] {
        let n = grid.count
        let m = grid[0].count
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        let sortedQueries = queries.enumerated().sorted { $0.element < $1.element }
        var result = Array(repeating: 0, count: queries.count)
        var minHeap = HeapModule.Heap([Val(val: grid[0][0], x: 0, y: 0)])
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        visited[0][0] = true
        var points = 0
        for (i, q) in sortedQueries {
            while !minHeap.isEmpty, minHeap.min!.val < q {
                let val = minHeap.removeMin()
                points += 1
                for (dr, dc) in directions {
                    let nr = val.x + dr, nc = val.y + dc
                    if nr >= 0, nr < n, nc >= 0, nc < m, !visited[nr][nc] {
                        minHeap.insert(Val(val: grid[nr][nc], x: nr, y: nc))
                        visited[nr][nc] = true
                    }
                }
            }
            result[i] = points
        }
        return result
    }
    
    func tests() {
        print(maxPoints([[1,2,3],[2,5,7],[3,5,1]], [5,6,2])) // [5,8,1]
        print(maxPoints([[5,2,1],[1,1,2]], [3])) // [0]
    }
}
