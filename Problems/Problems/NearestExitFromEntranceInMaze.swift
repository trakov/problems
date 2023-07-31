class NearestExitFromEntranceInMaze {
    
    var points: Set<[Int]> = []

    func isValid(_ point: [Int], _ maze: [[Character]]) -> Bool {
        let i = point.first!
        let j = point.last!
        let n = maze.count
        let m = maze.first!.count
        guard i >= 0, j >= 0, i < n, j < m else { return false }
        guard !points.contains([i, j]) else { return false }
        return maze[i][j] == "."
    }
    
    func isBorder(_ point: [Int], _ maze: [[Character]]) -> Bool {
        let i = point.first!
        let j = point.last!
        let n = maze.count
        let m = maze.first!.count

        return i == 0 || i == n-1 || j == 0 || j == m-1
    }
    
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        points.insert(entrance)
        var d = 0
        var queue = [entrance]
        while !queue.isEmpty {
            d += 1
            var newQueue: [[Int]] = []
            var isEnd = true
            for q in queue {
                let i = q[0]
                let j = q[1]
                for p in [[i-1, j], [i+1, j], [i, j-1], [i, j+1]] {
                    guard isValid(p, maze) else { continue }
                    isEnd = false
                    guard !isBorder(p, maze) else { return d }
                    points.insert(p)
                    newQueue.append(p)
                }
            }
            if isEnd {
                return -1
            }
            queue = newQueue
        }
        
        if d == 0 {
            return -1
        }
        return d
    }

    func tests() {
        print(nearestExit(
            [
                ["+",".","+","+","+","+","+"],
                ["+",".","+",".",".",".","+"],
                ["+",".","+",".","+",".","+"],
                ["+",".",".",".","+",".","+"],
                ["+","+","+","+","+",".","+"]
            ],
            [3,2]
        ))

//        return

        points.removeAll()
        
        print(nearestExit(
            [
                ["+",".","+","+","+","+","+"],
                ["+",".","+",".",".",".","+"],
                ["+",".","+",".","+",".","+"],
                ["+",".",".",".",".",".","+"],
                ["+","+","+","+",".","+","."]
            ],
            [0,1]
        ))

        points.removeAll()

        print(nearestExit([["+","+",".","+"],[".",".",".","+"],["+","+","+","."]], [1,2])) // 1
        
        points.removeAll()
        
        print(nearestExit([["+","+","+"],[".",".","."],["+","+","+"]], [1,0])) // 2
        
        points.removeAll()
        
        print(nearestExit([[".","+"]], [0,0])) // -1
    }
}
