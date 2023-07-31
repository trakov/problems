extension TreeNode {
    var deepCopy: TreeNode? {
        TreeNode(val, left?.deepCopy, right?.deepCopy)
    }
}

class AllPossibleFullBinaryTrees {
    private var map: [Int: [TreeNode?]] = [:]
    
    func allPossibleFBT(_ n: Int) -> [TreeNode?] {
        guard n % 2 == 1 else { return [] }
        guard n > 2 else { return [TreeNode(0)] }
        if let cached = map[n] { return cached }
        var result: [TreeNode?] = []
        for i in stride(from: 1, to: n, by: 2) {
            let left = allPossibleFBT(i)
            let right = allPossibleFBT(n - i - 1)
            for l in left {
                for r in right {
                    result.append(TreeNode(0, l, r))
                }
            }
        }
        map[n] = result
        return result
    }
    
    func tests() {
        print(allPossibleFBT(7)) //
        print(allPossibleFBT(3)) // [[0,0,0]]
    }
}

