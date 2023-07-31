class SoupServings {
    func soupServings(_ n: Int) -> Double {
        guard n <= 5000 else { return 1.0 }
        var n = n
        if n % 25 == 0 {
            n = n/25
        } else {
            n = n/25 + 1
        }
        var memo = Array(repeating: Array(repeating: -1.0, count: n + 1), count: n + 1)
        func helper(a: Int, b: Int) -> Double {
            if a <= 0 && b <= 0 { return 0.5 }
            if a <= 0 { return 1 }
            if b <= 0 { return 0 }
            if memo[a][b] != -1.0 { return memo[a][b] }
            memo[a][b] = 0.25 * (
                helper(a: a-4, b: b) +
                helper(a: a-3, b: b-1) +
                helper(a: a-2, b: b-2) +
                helper(a: a-1, b: b-3)
            )
            return memo[a][b]
        }
        
        return helper(a: n, b: n)
    }

    func soupServings2(_ n: Int) -> Double {
        var memo = Array(repeating: Array(repeating: -1.0, count: n + 1), count: n + 1)
        func helper(a: Int, b: Int) -> Double {
            if a <= 0 && b <= 0 { return 0.5 }
            if a <= 0 { return 1 }
            if b <= 0 { return 0 }
            if memo[a][b] != -1.0 { return memo[a][b] }
            memo[a][b] = 0.25 * (
                helper(a: a-100, b: b) +
                helper(a: a-75, b: b-25) +
                helper(a: a-50, b: b-50) +
                helper(a: a-25, b: b-75)
            )
            return memo[a][b]
        }
        
        return helper(a: n, b: n)
    }
    
    func tests() {
        print(soupServings(50)) // 0.625
        print(soupServings(100)) // 0.71875
        print(soupServings(1000)) // 0.9765650521094358
        print(soupServings(4000)) // 0.9999719963014364
        print(soupServings(5000)) // 0.9999967386599964
    }
}

