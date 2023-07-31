class SimilarStringGroups {
    func numSimilarGroups(_ strs: [String]) -> Int {
        let n = strs.count
        guard n > 1 else { return n }
        var adj = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0 ..< n {
            adj[i][i] = 1
            for j in i ..< n {
                if isSimilar(strs[i], strs[j]) {
                    adj[i][j] = 1
                    adj[j][i] = 1
                }
            }
        }
        return numberOfComponents(in: adj)
    }
    
    private func numberOfComponents(in adj: [[Int]]) -> Int {
        var visited = Array(repeating: false, count: adj.count)
        var count = 0
        
        for i in 0..<visited.count {
            guard visited[i] == false else { continue }
            visited[i] = true
            count += 1
            var queue = [i]
            while !queue.isEmpty {
                var newQueue: [Int] = []
                for node in queue {
                    for (index, n) in adj[node].enumerated() {
                        guard n == 1 && !visited[index] else { continue }
                        visited[index] = true
                        newQueue.append(index)
                    }
                }
                queue = newQueue
            }
        }
        
        return count
    }
    
    private func isSimilar(_ w1: String, _ w2: String) -> Bool {
        var diff = 0
        var i = w1.startIndex
        while i < w1.endIndex {
            diff += (w1[i] == w2[i]) ? 0 : 1
            guard diff < 3 else { return false }
            i = w1.index(after: i)
        }
        return true
    }
    
    func tests() {
        print(numSimilarGroups(["tars","rats","arts","star"])) // 2
        print(numSimilarGroups(["omv","ovm"])) // 1
    }
}
