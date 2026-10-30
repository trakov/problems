import HeapModule

final class ShortestPathWithAtMostKConsecutiveIdenticalCharacters {
    struct State: Comparable {
        let d: Int
        let x: Int
        let cnt: Int
        static func < (lhs: State, rhs: State) -> Bool {
            lhs.d < rhs.d
        }
    }

    func shortestPath(_ n: Int, _ edges: [[Int]], _ labels: String, _ k: Int) -> Int {
        var g = Array(repeating: [(Int, Int)](), count: n)
        for e in edges {
            g[e[0]].append((e[1], e[2]))
        }
        let chars = Array(labels)
        var dis = Array(repeating: Array(repeating: Int.max, count: k + 1), count: n)
        var pq = HeapModule.Heap<State>()
        dis[0][1] = 0
        pq.insert(State(d: 0, x: 0, cnt: 1))
        while let cur = pq.popMin() {
            let (d, x, cnt) = (cur.d, cur.x, cur.cnt)
            if d > dis[x][cnt] {
                continue
            }
            if x == n - 1 {
                return d
            }
            for (y, w) in g[x] {
                let newCnt = chars[x] == chars[y] ? cnt + 1 : 1
                if newCnt > k {
                    continue
                }
                let nd = d + w
                if nd < dis[y][newCnt] {
                    dis[y][newCnt] = nd
                    pq.insert(State(d: nd, x: y, cnt: newCnt))
                }
            }
        }
        return -1
    }
    
    func tests() {
        print(shortestPath(3, [[0,1,1],[1,2,1],[0,2,3]], "aab", 1)) // 3
        print(shortestPath(3, [[0,1,1],[1,2,1]], "aaa", 2)) // -1
        print(shortestPath(3, [[0,1,1],[1,2,1],[0,2,3]], "aab", 2)) // 2
    }
}
