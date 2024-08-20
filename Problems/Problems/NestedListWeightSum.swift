class NestedListWeightSum {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        var queue = nestedList
        var sum = 0
        var d = 1

        while !queue.isEmpty {
            var next: [NestedInteger] = []
            for item in queue {
                if item.isInteger() {
                    sum += item.getInteger() * d
                } else {
                    next.append(contentsOf: item.getList())
                }
            }
            d += 1
            queue = next
        }

        return sum
    }

    func recursive(_ nestedList: [NestedInteger]) -> Int {
        func dfs(_ list: [NestedInteger], _ depth: Int) -> Int {
            var sum = 0
            for item in list {
                if item.isInteger() {
                    sum += item.getInteger() * depth
                } else {
                    sum += dfs(item.getList(), depth + 1)
                }
            }
            return sum
        }
        return dfs(nestedList, 1)
    }
    
    func tests() {
//        Input: [[1,1],2,[1,1]]
//        Output: 10
//        Four 1's at depth 2, one 2 at depth 1.
//
//        Input: [1,[4,[6]]]
//        Output: 27
//        One 1 at depth 1, one 4 at depth 2, and one 6 at depth 3; 1 + 4*2 + 6*3 = 27.
    }
}

