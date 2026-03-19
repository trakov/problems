final class CountSubmatricesWithEqualFrequencyofXandY {
    func numberOfSubmatrices(_ grid: [[Character]]) -> Int {
        let m = grid[0].count
        var row = Array(repeating: (0, 0), count: m)
        var result = 0
        for r in grid {
            var (x, y) = (0, 0)
            for (j, c) in r.enumerated() {
                if c == "X" {
                    x += 1
                } else if c == "Y" {
                    y += 1
                }
                row[j] = (row[j].0 + x, row[j].1 + y)
                if row[j].0 > 0 && row[j].0 == row[j].1 {
                    result += 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(numberOfSubmatrices([["X","Y","."],["Y",".","."]])) // 3
        print(numberOfSubmatrices([["X","X"],["X","Y"]])) // 0
        print(numberOfSubmatrices([[".","."],[".","."]])) // 0
    }
}
