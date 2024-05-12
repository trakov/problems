class LargestLocalValuesinaMatrix {
    func largestLocal(_ grid: [[Int]]) -> [[Int]] {
        let n = grid.count
        var result = Array(repeating: Array(repeating: -1, count: n - 2), count: n - 2)
        for i in 1..<n-1 {
            for j in 1..<n-1 {
                let localMax = [
                    (-1,-1),(-1,0),(-1,1),(0,-1),(0,0),(0,1),(1,-1),(1,0),(1,1)
                ].map { grid[i + $0][j + $1] }.max()!
                result[i - 1][j - 1] = localMax
            }
        }
        return result
    }
    
    func tests() {
        print(largestLocal([[9,9,8,1],[5,6,2,6],[8,2,6,4],[6,2,2,2]]))
        // [[9,9],[8,6]]
        print(largestLocal([[1,1,1,1,1],[1,1,1,1,1],[1,1,2,1,1],[1,1,1,1,1],[1,1,1,1,1]]))
        // [[2,2,2],[2,2,2],[2,2,2]]
    }
}
