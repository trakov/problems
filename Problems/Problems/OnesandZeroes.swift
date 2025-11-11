final class OnesandZeroes {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var counts: [(Int, Int)] = []
        for str in strs {
            var num0 = 0, num1 = 0
            for i in str {
                if i == "0" {
                    num0 += 1
                } else {
                    num1 += 1
                }
            }
            counts.append((num0, num1))
        }
        var memo = Array(
            repeating: Array(repeating: Array(repeating: -1, count: n+1), count: m+1),
            count: counts.count
        )
        func find(_ index: Int, _ m: Int, _ n: Int) -> Int {
            if index == counts.count || m < 0 || n < 0 { return 0 }
            if memo[index][m][n] != -1 {
                return memo[index][m][n]
            }
            if m - counts[index].0 >= 0 && n - counts[index].1 >= 0 {
                let len1 = find(index + 1, m - counts[index].0, n - counts[index].1) + 1
                let len2 = find(index + 1, m, n)
                memo[index][m][n] = max(len1, len2)
                return memo[index][m][n]
            }
            memo[index][m][n] = find(index + 1, m, n)
            return memo[index][m][n]
        }
        return find(0, m, n)
    }
    
    func tests() {
        print(findMaxForm(["10","0001","111001","1","0"], 5, 3)) // 4
        print(findMaxForm(["10","0","1"], 1, 1)) // 2
    }
}
