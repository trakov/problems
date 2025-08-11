final class RangeProductQueriesofPowers {
    func productQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        let mod = 1_000_000_007
        var bins: [Int] = []
        var rep = 1
        var n = n
        while n > 0 {
            if n % 2 == 1 {
                bins.append(rep)
            }
            n /= 2
            rep *= 2
        }
        let m = bins.count
        var results = Array(repeating: Array(repeating: 0, count: m), count: m)
        for i in 0..<m {
            var cur = 1
            for j in i..<m {
                cur = (cur * bins[j]) % mod
                results[i][j] = cur
            }
        }
        var ans = Array(repeating: 0, count: queries.count)
        for i in 0..<queries.count {
            ans[i] = results[queries[i][0]][queries[i][1]]
        }
        return ans
    }
    
    func tests() {
        print(productQueries(15, [[0,1],[2,2],[0,3]])) // [2,4,64]
        print(productQueries(2, [[0,0]])) // [2]
    }
}
