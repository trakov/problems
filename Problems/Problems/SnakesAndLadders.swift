class SnakesAndLadders {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var result: [[Int]] = [[root!.val]]
        var queue: [TreeNode] = [root!]
        while !queue.isEmpty {
            var newQueue: [TreeNode] = []
            for q in queue {
                if q.left != nil { queue.append(q.left!) }
                if q.right != nil { queue.append(q.right!) }
            }
            queue = newQueue
            if !queue.isEmpty {
                result.append(contentsOf: [queue.map {$0.val}])
            }
        }
        return result
    }

    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let n = board.count
        guard n > 2 else { return 1 }
        var way: [Int] = [0] // from 0 to n*n
        var i = n - 1
        while i >= 0 {
            way.append(contentsOf: ((n - 1 - i) % 2 == 0) ? board[i] : board[i].reversed())
            i -= 1
        }
        var queue = [1] // array index
        var visited: Set<Int> = [1]
        var result = 0
        while !queue.isEmpty {
            result += 1
            let size = queue.count
            for q in queue {
                var next: [Int] = []
                for candidate in Array(q+1...min(q+6, n*n)) {
                    let nn = way[candidate] == -1 ? candidate : way[candidate]
                    if nn == n*n { return result }
                    if visited.insert(nn).inserted {
                        next.append(nn)
                    }
                }
                queue.append(contentsOf: next)
            }
            queue.removeFirst(size)
        }
        
        return -1
    }

    func tests() {
        print(snakesAndLadders([[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]])) // 4
        print(snakesAndLadders([[-1,-1],[-1,3]])) // 1
        print(snakesAndLadders([[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]])) // 2
        print(snakesAndLadders([[-1,9,-1],[-1,-1,-1],[-1,-1,-1]])) // 2
        print(snakesAndLadders([[9,-1,-1],[-1,-1,-1],[-1,-1,-1]])) // 1
    }
}
