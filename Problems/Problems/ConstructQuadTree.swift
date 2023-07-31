import Foundation
public class Node {
    public var val: Bool
    public var isLeaf: Bool
    public var topLeft: Node?
    public var topRight: Node?
    public var bottomLeft: Node?
    public var bottomRight: Node?
    public init(_ val: Bool, _ isLeaf: Bool) {
        self.val = val
        self.isLeaf = isLeaf
        self.topLeft = nil
        self.topRight = nil
        self.bottomLeft = nil
        self.bottomRight = nil
    }
}

class ConstructQuadTree {
    func construct(_ grid: [[Int]]) -> Node? {
        construct(grid, top: 0, left: 0, n: grid.count)
    }
    
    func construct(_ grid: [[Int]], top: Int, left: Int, n: Int) -> Node? {
        guard n > 0 else { return nil }
        let val = grid[top][left]
        var isLeaf = true
        for i in top..<top + n {
            guard isLeaf else { break }
            for j in left..<left + n {
                guard val != grid[i][j] else { continue }
                isLeaf = false
                break
            }
        }
        let node = Node(val == 1, isLeaf)
        guard !isLeaf else { return node }
        node.topLeft = construct(grid, top: top, left: left, n: n/2)
        node.topRight = construct(grid, top: top, left: left + n/2, n: n/2)
        node.bottomLeft = construct(grid, top: top + n/2, left: left, n: n/2)
        node.bottomRight = construct(grid, top: top + n/2, left: left + n/2, n: n/2)
        return node
    }

    func tests() {
        var node: Node?
//        node = construct([[0,1],[1,0]]) // [[0,1],[1,0],[1,1],[1,1],[1,0]]
        node = construct([
            [1,1,1,1,0,0,0,0],
            [1,1,1,1,0,0,0,0],
            [1,1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1,1],
            [1,1,1,1,0,0,0,0],
            [1,1,1,1,0,0,0,0],
            [1,1,1,1,0,0,0,0],
            [1,1,1,1,0,0,0,0]
        ])
        // [[0,1],[1,1],[0,1],[1,1],[1,0],null,null,null,null,[1,0],[1,0],[1,1],[1,1]]
    }
}
