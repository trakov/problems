final class RearrangingFruits {
    func minCost(_ basket1: [Int], _ basket2: [Int]) -> Int {
        var map: [Int: Int] = [:]
        var m: Int = .max
        for fruit in basket1 {
            map[fruit, default: 0] += 1
            m = min(m, fruit)
        }
        for fruit in basket2 {
            map[fruit, default: 0] -= 1
            m = min(m, fruit)
        }
        var merge: [Int] = []
        for (fruit, count) in map {
            guard count % 2 == 0 else { return -1 }
            for _ in 0..<abs(count)/2 {
                merge.append(fruit)
            }
        }
        merge.sort()
        var result = 0
        for f in merge.dropLast(merge.count / 2) {
            result += min(2 * m, f)
        }
        return result
    }
    
    func tests() {
        print(minCost([4,2,2,2], [1,4,1,2])) // 1
        print(minCost([2,3,4,1], [3,2,5,1])) // -1
        print(minCost([84,80,43,8,80,88,43,14,100,88], [32,32,42,68,68,100,42,84,14,8])) // 48
    }
}
