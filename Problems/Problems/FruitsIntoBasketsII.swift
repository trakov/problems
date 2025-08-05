final class FruitsIntoBasketsII {
    func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
        let n = fruits.count
        var takenBaskets = Array(repeating: false, count: n)
        for fruit in fruits {
            for (i, capacity) in baskets.enumerated() {
                if !takenBaskets[i], fruit <= capacity {
                    takenBaskets[i] = true
                    break
                }
            }
        }
        return takenBaskets.reduce(0) { $0 + ($1 ? 0 : 1) }
    }
    
    func tests() {
        print(numOfUnplacedFruits([4,2,5], [3,5,4])) // 1
        print(numOfUnplacedFruits([3,6,1], [6,4,7])) // 0
    }
}
