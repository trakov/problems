class SlidingPuzzle {
    var dirs = [
        0: [1, 3],
        1: [0, 2, 4],
        2: [1, 5],
        3: [0, 4],
        4: [1, 3, 5],
        5: [2, 4]
    ]

    func slidingPuzzle(_ board: [[Int]]) -> Int {
        let dest = [1, 2, 3, 4, 5, 0]
        let start = board.flatMap { $0 }
        var visited = Set([start])
        var queue = [start]
        var moves = 0
        while !queue.isEmpty {
            var next: [[Int]] = []
            for b in queue {
                if b == dest { return moves }
                let indexOfZero = b.firstIndex(of: 0)!
                for dir in dirs[indexOfZero]! {
                    var updated = b
                    updated.swapAt(indexOfZero, dir)
                    if !visited.contains(updated) {
                        next.append(updated)
                        visited.insert(updated)
                    }
                }
            }
            queue = next
            moves += 1
        }
        return -1
    }

    func tests() {
        print(slidingPuzzle([[1,2,3],[4,0,5]])) // 1
        print(slidingPuzzle([[1,2,3],[5,4,0]])) // -1
        print(slidingPuzzle([[4,1,2],[5,0,3]])) // 5
    }
}

