class FindEventualSafeStates {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        let n = graph.count
        var state = Array(repeating: 0, count: n) // 1-safe, -1-cycle
        
        func isSafe(i: Int) -> Bool {
            guard state[i] == 0 else { return state[i] == 1 }
            state[i] = -1
            for c in graph[i] where state[c] != 1 {
                if !isSafe(i: c) {
                    return false
                }
            }
            state[i] = 1
            return true
        }
        var result: [Int] = []
        for i in 0..<n {
            guard isSafe(i: i) else { continue }
            result.append(i)
        }
        return result
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func eventualSafeNodes2(_ graph: [[Int]]) -> [Int] {
        let n = graph.count
        var colors = Array(repeating: 0, count: n) // 0 - undef, -1 - cycle, 1 - safe

        func isSafe(_ i: Int) -> Bool {
            guard colors[i] == 0 else { return colors[i] == 1 }
            colors[i] = -1
            for j in graph[i] {
                guard colors[j] != 1 else { continue }
                if !isSafe(j) {
                    return false
                }
            }
            colors[i] = 1
            return true
        }
        
        var result: [Int] = []
        for i in 0..<n {
            if isSafe(i) {
                result.append(i)
            }
        }
        return result
    }

    func tests() {
        print(eventualSafeNodes([[],[],[],[]])) // [0,1,2,3]
        print(eventualSafeNodes([[1,2],[2,3],[5],[0],[5],[],[]])) // [2,4,5,6]
        print(eventualSafeNodes([[1,2,3,4],[1,2],[3,4],[0,4],[]])) // [4]
    }
}
