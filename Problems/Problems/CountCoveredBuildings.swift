final class CountCoveredBuildings {
    func countCoveredBuildings(_ n: Int, _ buildings: [[Int]]) -> Int {
        var maxRow = Array(repeating: 0, count: n + 1)
        var minRow = Array(repeating: Int.max, count: n + 1)
        var maxCol = Array(repeating: 0, count: n + 1)
        var minCol = Array(repeating: Int.max, count: n + 1)
        for b in buildings {
            let (x, y) = (b[0], b[1])
            maxRow[y] = max(maxRow[y], x)
            minRow[y] = min(minRow[y], x)
            maxCol[x] = max(maxCol[x], y)
            minCol[x] = min(minCol[x], y)
        }
        var result = 0
        for b in buildings {
            let (x, y) = (b[0], b[1])
            if x > minRow[y] && x < maxRow[y] && y > minCol[x] && y < maxCol[x] {
                result += 1
            }
        }
        return result
    }
    
    func tests() {
        print(countCoveredBuildings(3, [[1,2],[2,2],[3,2],[2,1],[2,3]])) // 1
        print(countCoveredBuildings(3, [[1,1],[1,2],[2,1],[2,2]])) // 0
        print(countCoveredBuildings(5, [[1,3],[3,2],[3,3],[3,5],[5,3]])) // 1
    }
}
