class SmallestStringStartingFromLeaf {
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        var result = "~"
        func string(of nodeVal: Int) -> String {
            String(Character(
                UnicodeScalar(Int(Character("a").asciiValue!) + nodeVal)!
            ))
        }
        func dfs(_ node: TreeNode?, _ current: String) {
            guard let node = node else { return }
            let current = string(of: node.val) + current
            if node.left == nil && node.right == nil {
                result = min(result, current)
            }
            dfs(node.left, current)
            dfs(node.right, current)
        }
        dfs(root, "")
        return result
    }
    
    func tests() {
        print(smallestFromLeaf(
            TreeNode(0, TreeNode(1,3,4), TreeNode(2,3,4))
        )) // "dba"
        print(smallestFromLeaf(
            TreeNode(25, TreeNode(1,1,3), TreeNode(3,0,2))
        )) // "adz"
        print(smallestFromLeaf(
            TreeNode(2, TreeNode(2,nil,TreeNode(1,0,nil)), TreeNode(1,0,nil))
        )) // "abc"
    }
}

