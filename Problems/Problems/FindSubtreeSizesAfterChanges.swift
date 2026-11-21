final class FindSubtreeSizesAfterChanges {
    func findSubtreeSizes(_ parent: [Int], _ s: String) -> [Int] {
        let n = parent.count
        let chars = Array(s.utf8)
        var adj = Array(repeating: [Int](), count: n)
        for i in 1..<n {
            adj[parent[i]].append(i)
        }
        var newParent = parent
        var charAncestor = Array(repeating: -1, count: 26)
        func dfs1(_ u: Int) {
            let c = Int(chars[u] - 97)
            let prev = charAncestor[c]
            if prev != -1 {
                newParent[u] = prev
            }
            charAncestor[c] = u
            for v in adj[u] {
                dfs1(v)
            }
            charAncestor[c] = prev
        }
        dfs1(0)
        var newAdj = Array(repeating: [Int](), count: n)
        for i in 1..<n {
            newAdj[newParent[i]].append(i)
        }
        var subtreeSize = Array(repeating: 0, count: n)
        @discardableResult
        func dfs2(_ u: Int) -> Int {
            var sz = 1
            for v in newAdj[u] {
                sz += dfs2(v)
            }
            subtreeSize[u] = sz
            return sz
        }
        dfs2(0)
        return subtreeSize
    }
    
    func tests() {
        print(findSubtreeSizes([-1,0,0,1,1,1], "abaabc")) // [6,3,1,1,1,1]
        print(findSubtreeSizes([-1,0,4,0,1], "abbba")) // [5,2,1,1,1]
    }
}
