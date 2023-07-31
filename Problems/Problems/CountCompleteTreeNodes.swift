import Foundation
class CountCompleteTreeNodes {
    func countNodes(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        var stack: [TreeNode] = []
        var node = root
        var count = 0
        while !stack.isEmpty || node != nil {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            node = stack.removeLast()
            count += 1
            node = node?.right
        }
        
        return count
    }
    
    func weird(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        var hTree = 0
        var node = root
        while node != nil {
            node = node?.left
            hTree += 1
        }
        var count = Int(pow(2.0, Double(hTree))) - 1
        
        var h = 1
        node = root?.right
        while node != nil {
            node = node?.left
            h += 1
        }
        
        if h < hTree {
            count -= Int(pow(2.0, Double(hTree - 2)))
        }
        
        return count
    }
    func tests() {
        var root = TreeNode(
            1,
            TreeNode(
                2,
                TreeNode(4, nil, nil),
                TreeNode(5, nil, nil)
            ),
            TreeNode(
                3,
//                nil,
                TreeNode(6, nil, nil),
                nil
//                TreeNode(7, nil, nil)
            )
        )
        print(countNodes(root))
    }
}
