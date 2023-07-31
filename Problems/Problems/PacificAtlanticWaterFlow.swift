class PacificAtlanticWaterFlow {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let m = heights.count
        let n = heights[0].count
        
        func dfs(_ r: Int, _ c: Int, _ res: inout Set<[Int]>) {
            res.insert([r,c])
            let h = heights[r][c]
            for (dr, dc) in [(-1,0), (1,0), (0,-1), (0,1)] {
                let (r1, c1) = (r+dr, c+dc)
                guard 0 <= r1 && r1 < m && 0 <= c1 && c1 < n else { continue }
                if h <= heights[r1][c1] {
                    if !res.contains([r1, c1]) {
                        dfs(r1, c1, &res)
                    }
                }
            }
        }
        
        var (pac, atl) = (Set<[Int]>(), Set<[Int]>())
        
        for i in 0..<m {
            dfs(i, 0, &pac)
            dfs(i, n-1, &atl)
        }
        for j in 0..<n {
            dfs(0, j, &pac)
            dfs(m-1, j, &atl)
        }
        return Array(pac.intersection(atl))
    }

    func tests() {
        print(pacificAtlantic([[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]))
        // [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
        print(pacificAtlantic([[1]])) // [[0,0]]
    }
}
