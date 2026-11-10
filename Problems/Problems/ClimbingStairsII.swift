final class ClimbingStairsII {
    func climbStairs(_ n: Int, _ costs: [Int]) -> Int {
        var (a, b, c) = (0, 0, 0)
        for cost in costs {
            let next = min(min(a + 9, b + 4), c + 1) + cost
            (a, b, c) = (b, c, next)
        }
        return c
    }
    
    func tests() {
        print(climbStairs(4, [1,2,3,4])) // 13
        print(climbStairs(4, [5,1,6,2])) // 11
        print(climbStairs(3, [9,8,3])) // 12
    }
}
