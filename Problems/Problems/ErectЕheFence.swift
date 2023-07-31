class ErectЕheFence {
    func outerTrees(_ trees: [[Int]]) -> [[Int]] {
        var result: [[Int]] = []
        
        for t in trees {
            append(t: t, to: &result)
        }
        
        return result
    }
    
    func append(t: [Int], to result: inout [[Int]]) {
        guard result.count > 2 else {
            result.append(t)
            return
        }
        
        
        
    }

    func tests() {
        print(outerTrees([[1,1],[2,2],[2,0],[2,4],[3,3],[4,2]])) // [[1,1],[2,0],[3,3],[2,4],[4,2]]
        print(outerTrees([[1,2],[2,2],[4,2]])) // [[1,2],[2,2],[4,2]]
    }
}
