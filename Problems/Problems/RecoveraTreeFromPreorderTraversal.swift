class RecoveraTreeFromPreorderTraversal {
    func recoverFromPreorder(_ traversal: String) -> TreeNode? {
        var levels: [TreeNode] = []
        var i = 0
        let traversal = Array(traversal)
        let n = traversal.count
        while i < n {
            var depth = 0
            while i < n && traversal[i] == "-" {
                depth += 1
                i += 1
            }
            var value = 0
            while i < n, let num = Int(String(traversal[i])) {
                value = value * 10 + num
                i += 1
            }
            var node = TreeNode(value)
            if depth < levels.count {
                levels[depth] = node
            } else {
                levels.append(node)
            }
            if depth > 0 {
                let parent = levels[depth - 1]
                if parent.left == nil {
                    parent.left = node
                } else {
                    parent.right = node
                }
            }
        }
        return levels.first
    }
    
    func tests() {
        var root = recoverFromPreorder("1-2--3--4-5--6--7")
        root = recoverFromPreorder("1-2--3---4-5--6---7")
        root = recoverFromPreorder("1-401--349---90--88")
    }
}

