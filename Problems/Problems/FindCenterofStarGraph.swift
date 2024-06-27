class FindCenterofStarGraph {
    func findCenter(_ edges: [[Int]]) -> Int {
        let set = Set(edges[0])
        for node in edges[1] where set.contains(node) {
            return node
        }
        return -1
    }
    
    func tests() {
        print(findCenter([[1,2],[2,3],[4,2]])) // 2
        print(findCenter([[1,2],[5,1],[1,3],[1,4]])) // 1
    }
}

