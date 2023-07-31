class ClimbingStairs {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var a = 1
        var b = 1
        for _ in (2...n) {
            (a, b) = (b, a + b)
        }
        return b
    }

    func tests() {
        print(climbStairs(1)) // 1
        print(climbStairs(2)) // 2
        print(climbStairs(3)) // 3
        print(climbStairs(4)) // 5
        print(climbStairs(5)) // 8
        print(climbStairs(6)) // 13
    }
}
