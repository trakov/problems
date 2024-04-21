class FindAllGroupsOfFarmland {
    func findFarmland(_ land: [[Int]]) -> [[Int]] {
        let n = land.count
        let m = land[0].count
        var land = land
        
        func find(_ i: Int, _ j: Int) -> (Int, Int) {
            guard i >= 0 && i < n && j >= 0 && j < m else { return (0, 0) }
            guard land[i][j] == 1 else { return (0, 0) }
            land[i][j] = 0
            let r1 = find(i - 1, j)
            let r2 = find(i + 1, j)
            let r3 = find(i, j - 1)
            let r4 = find(i, j + 1)
            return (max(i, r1.0, r2.0, r3.0, r4.0), max(j, r1.1, r2.1, r3.1, r4.1))
        }
        
        var result: [[Int]] = []
        for i in 0..<n {
            for j in 0..<m where land[i][j] == 1 {
                let bottomRight = find(i, j)
                result.append([i, j, bottomRight.0, bottomRight.1])
            }
        }
        return result
    }
    
    func tests() {
        print(findFarmland([[1,1,0,0,0,1],[1,1,0,0,0,0]]))
        // [[0,0,1,1],[0,5,0,5]]
        print(findFarmland([[1,0,0],[0,1,1],[0,1,1]]))
        // [[0,0,0,0],[1,1,2,2]]
        print(findFarmland([[1,1],[1,1]]))
        // [[0,0,1,1]]
        print(findFarmland([[0]])) // []
    }
}

