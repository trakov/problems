class BinarySearchTreeIterator {
    
    class BSTIterator {
        private var array: [Int] = []
        private var curIndex = -1
        init(_ root: TreeNode?) {
            fillInorder(with: root)
        }
        
        func next() -> Int {
            curIndex += 1
            return array[curIndex]
        }
        
        func hasNext() -> Bool {
            return curIndex + 1 < array.count
        }
        
        private func fillInorder(with root: TreeNode?) {
            guard let node = root else { return }
            fillInorder(with: node.left)
            array.append(node.val)
            fillInorder(with: node.right)
        }
    }
    
    func tests() {
        var tree = TreeNode(7, TreeNode(3), TreeNode(15, TreeNode(9), TreeNode(20)))
        var bst = BSTIterator(tree)
        print(bst.next())
        print(bst.next())
        print(bst.hasNext())
        print(bst.next())
        print(bst.hasNext())
        print(bst.next())
        print(bst.hasNext())
        print(bst.next())
        print(bst.hasNext())
    }
}
