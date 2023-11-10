class RestoreTheArrayFromAdjacentPairs {
    func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
        let n = adjacentPairs.count + 1
        var map: [Int: [Int]] = [:]
        for pair in adjacentPairs {
            map[pair[0], default: []].append(pair[1])
            map[pair[1], default: []].append(pair[0])
        }
        var edge = 0
        for (e, neighs) in map where neighs.count == 1 {
            edge = e
            break
        }
        var result = Array(repeating: edge, count: n)
        var i = 1
        while i < n {
            let next = map.removeValue(forKey: edge)!.first!
            map[next]?.removeAll(where: { $0 == edge })
            result[i] = next
            edge = next
            i += 1
        }
        return result
    }
    
    func tests() {
        print(restoreArray([[2,1],[3,4],[3,2]])) // [1,2,3,4]
        print(restoreArray([[4,-2],[1,4],[-3,1]]))
        // [-2,4,1,-3] / [-3,1,4,-2]
    }
}

