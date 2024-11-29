//import Collections

class MinimumTimetoVisitaCellInaGrid {
    struct Node: Comparable {
        let row: Int
        let col: Int
        let time: Int
        static func < (lhs: Node, rhs: Node) -> Bool {
            lhs.time < rhs.time
        }
    }

    func minimumTime(_ grid: [[Int]]) -> Int {
        guard grid[0][1] <= 1 || grid[1][0] <= 1 else { return -1 }
        let (m, n) = (grid.count, grid.first?.count ?? 0)
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var heap = Heap<Node>(array: [Node(row: 0, col: 0, time: 0)], sort: <)
        while let currentNode = heap.remove() {
            if (currentNode.row, currentNode.col) == (m - 1, n - 1) { return currentNode.time }
            if visited[currentNode.row][currentNode.col] { continue }
            for (dr, dc) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
                let (nextRow, nextCol) = (currentNode.row + dr, currentNode.col + dc)
                if !(0..<m).contains(nextRow) || !(0..<n).contains(nextCol) { continue }
                let waitTime = (grid[nextRow][nextCol] - currentNode.time) % 2 == 0 ? 1 : 0
                let nextTime = max(grid[nextRow][nextCol] + waitTime, currentNode.time + 1)
                heap.insert(Node(row: nextRow, col: nextCol, time: nextTime))
            }
            visited[currentNode.row][currentNode.col] = true
        }
        return -1
    }
    
    func tests() {
        print(minimumTime([[0,1,3,2],[5,1,2,5],[4,3,8,6]])) // 7
        print(minimumTime([[0,2,4],[3,2,1],[1,0,4]])) // -1
    }
}
