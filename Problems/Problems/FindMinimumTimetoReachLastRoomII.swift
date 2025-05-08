import HeapModule

final class FindMinimumTimetoReachLastRoomII {
    struct Path: Comparable {
        let x: Int
        let y: Int
        let time: Int
        static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.x == rhs.x && lhs.y == rhs.y && lhs.time == rhs.time
        }
        static func < (lhs: Self, rhs: Self) -> Bool {
            if lhs.time == rhs.time {
                if lhs.x == rhs.x { return lhs.y < rhs.y }
                return lhs.x < rhs.x
            }
            return lhs.time < rhs.time
        }
    }

    func minTimeToReach(_ moveTime: [[Int]]) -> Int {
        var heap = HeapModule.Heap<Path>()
        let n = moveTime.count
        let m = moveTime[0].count
        var visited = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        heap.insert(Path(x: 0, y: 0, time: 0))
        while let curr = heap.popMin() {
            if curr.x == n - 1 && curr.y == m - 1 {
                return curr.time
            }
            for (dx, dy) in [(-1,0), (1,0), (0, -1), (0, 1)] {
                let x = curr.x + dx, y = curr.y + dy
                guard x >= 0 && x < n && y >= 0 && y < m else { continue }
                let newTime = max(curr.time, moveTime[x][y]) + (curr.x + curr.y) % 2 + 1
                guard newTime < visited[x][y] else { continue }
                visited[x][y] = newTime
                heap.insert(Path(x: x, y: y, time: newTime))
            }
        }
        return -1
    }

    func tests() {
        print(minTimeToReach([[0,4],[4,4]])) // 7
        print(minTimeToReach([[0,0,0,0],[0,0,0,0]])) // 6
        print(minTimeToReach([[0,1],[1,2]])) // 4
    }
}
