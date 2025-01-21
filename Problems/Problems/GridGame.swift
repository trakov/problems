class GridGame {
    func gridGame(_ grid: [[Int]]) -> Int {
        let n = grid[0].count
        guard n > 1 else { return 0 }
        var right = grid[0].dropFirst().reduce(0, +)
        var left = 0
        var result = right
        for i in 0..<n-1 {
            left += grid[1][i]
            right -= grid[0][i+1]
            result = min(result, max(left, right))
        }
        return result
    }
    
    func tests() {
        print(gridGame([[2,5,4],[1,5,1]])) // 4
        print(gridGame([[3,3,1],[8,5,2]])) // 4
        print(gridGame([[1,3,1,15],[1,3,3,1]])) // 7
    }
}
