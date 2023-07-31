class FindTheTownJudge {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        guard !trust.isEmpty else { return n == 1 ? 1 : -1 }
        var candidates: [Int: Int] = [:] // index:count
        var map: [Int: [Int]] = [:] // person: trusted_persons
        for pair in trust {
            map[pair[0], default: []].append(pair[1])
            candidates[pair[1], default: 0] += 1
        }
        for (candidate, count) in candidates {
            if count == n-1 && map[candidate] == nil { return candidate }
        }
        return -1
    }

    func tests() {
        print(findJudge(2, [[1,2]])) // 2
        print(findJudge(3, [[1,3],[2,3]])) // 3
        print(findJudge(3, [[1,3],[2,3],[3,1]])) // -1
        print(findJudge(4, [[1,3],[1,4],[2,3],[2,4],[4,3]])) // 3
    }
}
