final class MinimumMovestoCleantheClassroom {
    struct Info {
        let x: Int
        let y: Int
        let mask: Int
        let e: Int
        let steps: Int
    }

    func minMoves(_ classroom: [String], _ energy: Int) -> Int {
        let (m, n) = (classroom.count, classroom[0].count)
        var id = Array(repeating: Array(repeating: 0, count: n), count: m)
        var (sx, sy, cnt) = (0, 0, 0)
        for i in 0..<m {
            for j in 0..<n {
                let c = classroom[i][classroom[i].index(classroom[i].startIndex, offsetBy: j)]
                if c == "S" {
                    sx = i
                    sy = j
                } else if c == "L" {
                    id[i][j] = 1 << cnt
                    cnt += 1
                }
            }
        }
        let full = 1 << cnt
        var bestEnergy = Array(
            repeating: Array(repeating: Array(repeating: -1, count: full), count: n),
            count: m
        )
        bestEnergy[sx][sy][0] = energy
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]
        var q = [Info(x: sx, y: sy, mask: 0, e: energy, steps: 0)]
        var head = 0
        while head < q.count {
            let t = q[head]
            head += 1
            if t.mask == full - 1 { return t.steps }
            if t.e == 0 { continue }
            for d in 0..<4 {
                let nx = t.x + dx[d]
                let ny = t.y + dy[d]
                if nx < 0 || nx >= m || ny < 0 || ny >= n { continue }
                let c = classroom[nx][classroom[nx].index(classroom[nx].startIndex, offsetBy: ny)]
                if c == "X" { continue }
                let ne = c == "R" ? energy : t.e - 1
                let nmask = t.mask | id[nx][ny]
                if ne > bestEnergy[nx][ny][nmask] {
                    bestEnergy[nx][ny][nmask] = ne
                    q.append(Info(x: nx, y: ny, mask: nmask, e: ne, steps: t.steps + 1))
                }
            }
        }
        return -1
    }
    
    func tests() {
        print(minMoves(["S.", "XL"], 2)) // 2
        print(minMoves(["LS", "RL"], 4)) // 3
        print(minMoves(["L.S", "RXL"], 3)) // -1
    }
}
