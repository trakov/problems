public class TreeNode: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Int
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    public required convenience init(integerLiteral value: Int) {
        self.init(value)
    }
}

class BinaryTreeInorderTraversal {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var node = root
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node!.left
            }
            node = stack.removeLast()
            result.append(node!.val)
            node = node!.right
        }
        return result
    }
    
    func recursive(_ node: TreeNode?) -> [Int] {
        if let node = node {
            return recursive(node.left) + [node.val] + recursive(node.right)
        } else {
            return []
        }
    }
    
    func tests() {
        
    }
}
