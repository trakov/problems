final class MaximumSquareAreabyRemovingFencesFromaField {
    func maximizeSquareArea(_ m: Int, _ n: Int, _ hFences: [Int], _ vFences: [Int]) -> Int {
        func getEdges(_ fences: [Int], _ border: Int) -> Set<Int> {
            var set: Set<Int> = []
            var list: [Int] = fences
            list.append(1)
            list.append(border)
            list.sort()
            for i in 0..<list.count-1 {
                for j in i+1..<list.count {
                    set.insert(list[j] - list[i])
                }
            }
            return set
        }
        let hEdges: Set<Int> = getEdges(hFences, m)
        let vEdges: Set<Int> = getEdges(vFences, n)
        var res = 0
        for e in hEdges where vEdges.contains(e) {
            res = max(res, e)
        }
        if res == 0 {
            return -1
        } else {
            return (res * res) % 1000000007
        }
    }
    
    func tests() {
        print(maximizeSquareArea(4, 3, [2,3], [2])) // 4
        print(maximizeSquareArea(6, 7, [2], [4])) // -1
    }
}
