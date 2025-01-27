class CourseScheduleIV {
    func checkIfPrerequisite(_ m: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var graph = Array(repeating: Array(repeating: false, count: m), count: m)
        for p in prerequisites {
            graph[p[1]][p[0]] = true
        }
        let n = queries.count
        var result = Array(repeating: false, count: n)
        for intermediate in 0..<m {
            for src in 0..<m {
                for target in 0..<m {
                    graph[src][target] =
                    graph[src][target] ||
                    (graph[src][intermediate] && graph[intermediate][target])
                }
            }
        }
        for (i, q) in queries.enumerated() {
            result[i] = graph[q[1]][q[0]]
        }
        return result
    }
    
    func tests() {
        print(checkIfPrerequisite(2, [[1,0]], [[0,1],[1,0]])) // [false,true]
        print(checkIfPrerequisite(2, [], [[1,0],[0,1]])) // [false,false]
        print(checkIfPrerequisite(3, [[1,2],[1,0],[2,0]], [[1,0],[1,2]])) // [true,true]
    }
}
