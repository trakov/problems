final class SetIntersectionSizeAtLeastTwo {
    func intersectionSizeTwo(_ intervals: [[Int]]) -> Int {
        var intervals = intervals.sorted {
            $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0]
        }
        var todo = Array(repeating: 2, count: intervals.count)
        var result = 0
        while let interval = intervals.popLast() {
            let start = interval[0]
            let t = todo.removeLast()
            for p in start..<start + t {
                for (i, inter) in intervals.enumerated() {
                    if todo[i] > 0 && p <= inter[1] {
                        todo[i] -= 1
                    }
                }
                result += 1
            }
        }
        return result
    }
    
    func tests() {
        print(intersectionSizeTwo([[1,3],[3,7],[8,9]])) // 5
        print(intersectionSizeTwo([[1,3],[1,4],[2,5],[3,5]])) // 3
        print(intersectionSizeTwo([[1,2],[2,3],[2,4],[4,5]])) // 5
    }
}
