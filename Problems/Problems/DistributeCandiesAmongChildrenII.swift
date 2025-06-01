final class DistributeCandiesAmongChildrenII {
    func distributeCandies(_ n: Int, _ limit: Int) -> Int {
        var result = 0
        for i in 0...min(limit, n) where n - i <= 2 * limit {
            result += min(n - i, limit) - max(0, n - i - limit) + 1
        }
        return result
    }
    
    func tests() {
        print(distributeCandies(5, 2)) // 3
        print(distributeCandies(3, 3)) // 10
    }
}
