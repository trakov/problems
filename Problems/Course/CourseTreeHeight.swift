class Tree {
    var value: Int
    var children: [Tree]
    init(value: Int, children: [Tree] = []) {
        self.value = value
        self.children = children
    }
}

class CourseTreeHeight {
    
    func process(parents: [Int]) -> Int {
        var dict: [Int: [Int]] = [:] // Parent value: Children values
        for (i, parent) in parents.enumerated() { // i - child value, parent - parent value
            dict[parent, default: []] += [i]
        }
        guard let parentValue = dict.removeValue(forKey: -1)?.first else { fatalError("No root in the tree") }
        let root = Tree(value: parentValue)
        fillTree(with: root, dict: dict)
        return treeHeight(node: root)
    }
    
    func fillTree(with root: Tree, dict: [Int: [Int]]) {
        guard let childValues = dict[root.value] else { return }
        root.children = childValues.map { Tree(value: $0) }
        for c in root.children {
            fillTree(with: c, dict: dict)
        }
    }
    
    func treeHeight(node: Tree?) -> Int {
        var height = 1
        for c in node?.children ?? [] {
            height = max(height, treeHeight(node: c) + 1)
        }
        return height
    }
    
    func tests() {
        print(process(parents: [4, -1, 4, 1, 1])) // 3
        print(process(parents: [-1, 0, 4, 0, 3])) // 4
        print(process(parents: [9, 7, 5, 5, 2, 9, 9, 9, 2, -1])) // 4
    }
}
