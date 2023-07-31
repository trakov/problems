class NumberOfWaysOfCuttingAPizza {
    func ways(_ pizza: [String], _ k: Int) -> Int {
        let pizza = pizza.map { Array($0) }
        let rows = pizza.count
        let cols = pizza[0].count
        var apples: [[Int]] = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)
        var f: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        for row in (0...rows-1).reversed() {
            for col in (0...cols-1).reversed() {
                apples[row][col] = (pizza[row][col] == "A" ? 1 : 0)
                + apples[row + 1][col]
                + apples[row][col + 1]
                - apples[row + 1][col + 1];
                f[row][col] = apples[row][col] > 0 ? 1 : 0
            }
        }
        let mod = 1000000007
        for _ in 1..<k {
            var g: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
            for row in 0..<rows {
                for col in 0..<cols {
                    for next_row in row+1..<rows {
                        if (apples[row][col] - apples[next_row][col] > 0) {
                            g[row][col] += f[next_row][col]
                            g[row][col] %= mod
                        }
                    }
                    for next_col in col+1..<cols {
                        if (apples[row][col] - apples[row][next_col] > 0) {
                            g[row][col] += f[row][next_col];
                            g[row][col] %= mod;
                        }
                    }
                }
            }
            f = g
        }
        return f[0][0]
    }
    
    func tests() {
        print(ways(["A..","AAA","..."], 3)) // 3
        print(ways(["A..","AA.","..."], 3)) // 1
        print(ways(["A..","A..","..."], 1)) // 1
    }
}

