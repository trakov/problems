final class FruitsIntoBasketsIII {
    func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
        var baskets = baskets
        let n = baskets.count
        let m = Int(Double(n).squareRoot())
        let section = (n + m - 1) / m
        var result = 0
        var maxV = Array(repeating: 0, count: section)
        for (i, b) in baskets.enumerated() {
            maxV[i / m] = max(maxV[i / m], b)
        }
        for fruit in fruits {
            var unset = 1
            for sec in 0..<section where maxV[sec] >= fruit {
                var choose = 0
                maxV[sec] = 0
                for i in 0..<m {
                    let pos = sec * m + i
                    if pos < n && baskets[pos] >= fruit && choose == 0 {
                        baskets[pos] = 0
                        choose = 1
                    }
                    if (pos < n) {
                        maxV[sec] = max(maxV[sec], baskets[pos])
                    }
                }
                unset = 0
                break
            }
            result += unset
        }
        return result
    }
    
    func tests() {
        print(numOfUnplacedFruits([4,2,5], [3,5,4])) // 1
        print(numOfUnplacedFruits([3,6,1], [6,4,7])) // 0
    }
}
