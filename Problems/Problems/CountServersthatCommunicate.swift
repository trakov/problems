class CountServersthatCommunicate {
    func countServers(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var rows = Array(repeating: 0, count: n)
        var cols = Array(repeating: 0, count: m)
        for (i, row) in grid.enumerated() {
            for (j, val) in row.enumerated() where val == 1 {
                rows[i] += 1
                cols[j] += 1
            }
        }
        var result = 0
        for (i, row) in grid.enumerated() {
            for (j, val) in row.enumerated() {
                guard val == 1 && (rows[i] > 1 || cols[j] > 1) else { continue }
                result += 1
            }
        }
        return result
    }
    
    func tests() {
        print(countServers([[1,0],[0,1]])) // 0
        print(countServers([[1,0],[1,1]])) // 3
        print(countServers([[1,1,0,0],[0,0,1,0],[0,0,1,0],[0,0,0,1]])) // 4
    }
}
