class DetonateTheMaximumBombs {
    func maximumDetonation(_ bombs: [[Int]]) -> Int {
        func isCovered(_ a: [Int], _ b: [Int]) -> Bool {
            let dx = a[0] - b[0]
            let dy = a[1] - b[1]
            return dx * dx + dy * dy <= a[2] * a[2]
        }
        var result = 1
        for i in 0..<bombs.count {
            var visited: Set<Int> = [i]
            var count = 1
            var queue = [i]
            while !queue.isEmpty {
                let bomber = queue.removeFirst()
                for j in 0..<bombs.count where !visited.contains(j) {
                    if isCovered(bombs[bomber], bombs[j]) {
                        count += 1
                        queue.append(j)
                        visited.insert(j)
                    }
                }
            }
            result = max(result, count)
        }
        
        return result
    }
    
    func tests() {
        print(maximumDetonation([[2,1,3],[6,1,4]])) // 2
        print(maximumDetonation([[1,1,5],[10,10,5]])) // 1
        print(maximumDetonation([[1,2,3],[2,3,1],[3,4,2],[4,5,3],[5,6,4]])) // 5
    }
}

