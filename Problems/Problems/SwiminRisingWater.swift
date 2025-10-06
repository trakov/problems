import HeapModule
final class SwiminRisingWater {
    struct Cell: Comparable {
        let time, r, c: Int
        static func < (lhs: Cell, rhs: Cell) -> Bool {
            return lhs.time < rhs.time
        }
    }

    func swimInWater(_ grid: [[Int]]) -> Int {
        let (n, m) = (grid.count, grid[0].count)
        var visited = Set([[0, 0]])
        var minHeap = HeapModule.Heap<Cell>()
        minHeap.insert(Cell(time: grid[0][0], r: 0, c: 0))
        let dir = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        while true {
            let cell = minHeap.popMin()!
            if cell.r == n-1, cell.c == m-1 { return cell.time }
            for (dr, dc) in dir {
                let (row, col) = (cell.r+dr, cell.c+dc)
                if row<0 || col<0 || row==n || col==m || visited.contains([row, col]) {
                    continue
                }
                visited.insert([row, col])
                minHeap.insert(
                    Cell(time: max(cell.time, grid[row][col]), r: row, c: col)
                )
            }
        }
        return -1
    }
    
    func tests() {
        print(swimInWater([[0,2],[1,3]])) // 3
        print(swimInWater([
            [0,1,2,3,4],[24,23,22,21,5],[12,13,14,15,16],[11,17,18,19,20],[10,9,8,7,6]
        ])) // 16
    }
}
