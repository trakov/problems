final class CountZeroRequestServers {
    func countServers(_ n: Int, _ logs: [[Int]], _ x: Int, _ queries: [Int]) -> [Int] {
        let logs = logs.sorted { $0[1] < $1[1] }
        let m = queries.count
        let ids = (0..<m).sorted { queries[$0] < queries[$1] }
        var result = Array(repeating: 0, count: m)
        var cnt = Array(repeating: 0, count: n + 1)
        var (left, right, active) = (0, 0, 0)
        for i in ids {
            let q = queries[i]
            while right < logs.count && logs[right][1] <= q {
                let id = logs[right][0]
                right += 1
                if cnt[id] == 0 {
                    active += 1
                }
                cnt[id] += 1
            }
            while left < right && logs[left][1] < q - x {
                let id = logs[left][0]
                left += 1
                cnt[id] -= 1
                if cnt[id] == 0 {
                    active -= 1
                }
            }
            result[i] = n - active
        }
        return result
    }
    
    func tests() {
        print(countServers(3, [[1,3],[2,6],[1,5]], 5, [10,11])) // [1,2]
        print(countServers(3, [[2,4],[2,1],[1,2],[3,1]], 2, [3,4])) // [0,1]
    }
}
