final class RemoveMethodsFromProject {
    func remainingMethods(_ n: Int, _ k: Int, _ invocations: [[Int]]) -> [Int] {
        let (g1, g2) = invocations.reduce(into: (g1: [Int: [Int]](), g2: [Int: [Int]]())) { into, inv in
            into.g1[inv[0], default: []].append(inv[1])
            into.g2[inv[1], default: []].append(inv[0])
        }
        var suspicious: Set<Int> = []
        var visited: Set<Int> = []
        func dfs(_ m: Int) {
            guard !visited.contains(m) else { return }
            visited.insert(m)
            suspicious.insert(m)
            g1[m]?.forEach(dfs)
        }
        dfs(k)
        guard !suspicious.contains(where: { m in
            g2[m]?.contains(where: { !suspicious.contains($0) }) == true
        }) else { return Array(0..<n) }
        return (0..<n).filter { !suspicious.contains($0) }
    }
    
    func tests() {
        print(remainingMethods(4, 1, [[1,2],[0,1],[3,2]])) // [0,1,2,3]
        print(remainingMethods(5, 0, [[1,2],[0,2],[0,1],[3,4]])) // [3,4]
        print(remainingMethods(3, 2, [[1,2],[0,1],[2,0]])) // []
    }
}
