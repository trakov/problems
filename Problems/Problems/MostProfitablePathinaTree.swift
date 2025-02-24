class MostProfitablePathinaTree {
    func mostProfitablePath(_ edges: [[Int]], _ bob: Int, _ amount: [Int]) -> Int {
        let n = amount.count
        var tree: [[Int]] = []
        for _ in 0..<n {
            tree.append([])
        }
        var distanceFromBob = Array(repeating: 0, count: n)
        for edge in edges {
            tree[edge[0]].append(edge[1])
            tree[edge[1]].append(edge[0])
        }
        
        func dfs(_ sourceNode: Int, _ parentNode: Int, _ time: Int) -> Int {
            var maxIncome = 0
            var maxChild = Int.min
            if sourceNode == bob {
                distanceFromBob[sourceNode] = 0
            } else {
                distanceFromBob[sourceNode] = n
            }
            for adjacentNode in tree[sourceNode] {
                if adjacentNode != parentNode {
                    maxChild = max(
                        maxChild,
                        dfs(adjacentNode, sourceNode, time + 1)
                    );
                    distanceFromBob[sourceNode] = min(
                        distanceFromBob[sourceNode],
                        distanceFromBob[adjacentNode] + 1
                    )
                }
            }
            if distanceFromBob[sourceNode] > time {
                maxIncome += amount[sourceNode]
            } else if distanceFromBob[sourceNode] == time {
                maxIncome += amount[sourceNode] / 2
            }
            return maxChild == Int.min ? maxIncome : maxIncome + maxChild
        }
        return dfs(0, 0, 0)
    }
    
    func tests() {
        print(mostProfitablePath([[0,1],[1,2],[1,3],[3,4]], 3, [-2,4,2,-4,6])) // 6
        print(mostProfitablePath([[0,1]], 1, [-7280,2350])) // -7280
    }
}

