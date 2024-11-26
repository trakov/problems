class FindChampionII {
    func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {
        var indegree = Array(repeating: 0, count: n)
        for edge in edges {
            indegree[edge[1]] += 1
        }
        var champ = -1
        var champCount = 0
        for (i, ind) in indegree.enumerated() where ind == 0 {
            champCount += 1
            champ = i
        }
        return champCount > 1 ? -1 : champ
    }
    
    func tests() {
        print(findChampion(3, [[0,1],[1,2]])) // 0
        print(findChampion(4, [[0,2],[1,3],[1,2]])) // -1
    }
}

