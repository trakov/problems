class UniqueBinarySearchTreesII {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        func generate(_ start: Int, _ end: Int) -> [TreeNode?] {
            guard start <= end else { return [nil] }
            var result: [TreeNode?] = []
            for value in start...end {
                for left in generate(start, value - 1) {
                    for right in generate(value + 1, end) {
                        result.append(TreeNode(value, left, right))
                    }
                }
            }
            return result
        }
        return generate(1, n)
    }
    
    func tests() {
        print(generateTrees(1)) // [[1]]
        print(generateTrees(3))
//        [[1,null,2,null,3],
//        [1,null,3,2],
//        [2,1,3],
//        [3,1,null,null,2],
//        [3,2,null,1]]
    }
}

