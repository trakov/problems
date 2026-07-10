final class PathExistenceQueriesinaGraphII {
    func pathExistenceQueries(_ n: Int, _ nums: [Int], _ maxDiff: Int, _ queries: [[Int]]) -> [Int] {
        let newNums = nums.enumerated().map { ($0.element, $0.offset) }.sorted { $0.0 < $1.0 }
        var getI = Array(repeating: 0, count: n)
        for (i, newNum) in newNums.enumerated() {
            getI[newNum.1] = i
        }
        var st = Array(repeating: Array(repeating: 0, count: 18), count: n)
        var r = 0
        for i in 0..<n {
            if r < i {
                r = i
            }
            while r + 1 < n &&
                    newNums[r + 1].0 - newNums[r].0 <= maxDiff &&
                    newNums[r + 1].0 - newNums[i].0 <= maxDiff {
                r += 1
            }
            st[i][0] = r
        }

        for j in 1..<18 {
            for i in 0..<n {
                st[i][j] = st[st[i][j - 1]][j - 1]
            }
        }
        var result = Array(repeating: 0, count: queries.count)
        for (i, q) in queries.enumerated() {
            var (a, b) = (getI[q[0]], getI[q[1]])
            if a > b { (a, b) = (b, a) }
            if a == b {
                result[i] = 0
                continue
            }
            var (curr, steps) = (a, 0)
            for j in (0...17).reversed() {
                if st[curr][j] < b {
                    curr = st[curr][j]
                    steps += (1 << j)
                }
            }
            result[i] = (st[curr][0] >= b) ? steps + 1 : -1
        }
        return result
    }
    
    func tests() {
        print(pathExistenceQueries(5, [1,8,3,4,2], 3, [[0,3],[2,4]])) // [1,1]
        print(pathExistenceQueries(5, [5,3,1,9,10], 2, [[0,1],[0,2],[2,3],[4,3]])) // [1,2,-1,1]
        print(pathExistenceQueries(3, [3,6,1], 1, [[0,0],[0,1],[1,2]])) // [0,-1,-1]
    }
}
