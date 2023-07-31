public class AVLTreeNode<Element> where Element: Comparable {
    public var val: Element
    public var left: AVLTreeNode?
    public var right: AVLTreeNode?
    public var height = 0
    
    public var balanceFactor: Int {
        leftHeight - rightHeight
    }
    
    public var leftHeight: Int {
        left?.height ?? -1
    }
    
    public var rightHeight: Int {
        right?.height ?? -1
    }
    
    public init(_ val: Element) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Element, _ left: AVLTreeNode?, _ right: AVLTreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

private extension AVLTreeNode {
    var min: AVLTreeNode {
        left?.min ?? self
    }
}

// MARK: Rotations
private extension AVLTreeNode {
    func leftRotate(_ node: AVLTreeNode<Element>) -> AVLTreeNode<Element> {
        let pivot = node.right!
        node.right = pivot.left
        pivot.left = node
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }
    
    func rightRotate(_ node: AVLTreeNode<Element>) -> AVLTreeNode<Element> {
        let pivot = node.left!
        node.left = pivot.right
        pivot.right = node
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }

    func rightLeftRotate(_ node: AVLTreeNode<Element>) -> AVLTreeNode<Element> {
        guard let rightChild = node.right else {
            return node
        }
        node.right = rightRotate(rightChild)
        return leftRotate(node)
    }
    
    func leftRightRotate(_ node: AVLTreeNode<Element>) -> AVLTreeNode<Element> {
        guard let leftChild = node.left else {
            return node
        }
        node.left = leftRotate(leftChild)
        return rightRotate(node)
    }
}

private extension AVLTreeNode {
    func insert(from node: AVLTreeNode<Element>?, value: Element) -> AVLTreeNode<Element> {
        guard let node = node else {
            return AVLTreeNode(value)
        }
        if value < node.val {
            node.left = insert(from: node.left, value: value)
        } else {
            node.right = insert(from: node.right, value: value)
        }
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
    
    func remove(node: AVLTreeNode<Element>?, value: Element) -> AVLTreeNode<Element>? {
        guard let node = node else {
            return nil
        }
        if value == node.val {
            if node.left == nil && node.right == nil {
                return nil
            }
            if node.left == nil {
                return node.right
            }
            if node.right == nil {
                return node.left
            }
            node.val = node.right!.min.val
            node.right = remove(node: node.right, value: node.val)
        } else if value < node.val {
            node.left = remove(node: node.left, value: value)
        } else {
            node.right = remove(node: node.right, value: value)
        }
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
}

private extension AVLTreeNode {
    func balanced(_ node: AVLTreeNode<Element>) -> AVLTreeNode<Element> {
        switch node.balanceFactor {
        case 2:
            if let leftChild = node.left,
               leftChild.balanceFactor == -1 {
                return leftRightRotate(node)
            } else {
                return rightRotate(node)
            }
        case -2:
            if let rightChild = node.right,
               rightChild.balanceFactor == 1 {
                return rightLeftRotate(node)
            } else {
                return leftRotate(node)
            }
        default:
            return node
        }
    }
}
