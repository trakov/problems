final class CountSubmatricesWithAllOnes {
    func numSubmat(_ mat: [[Int]]) -> Int {
        var sums = Array(
            repeating: Array(repeating: 0, count: mat[0].count + 1),
            count: mat.count + 1
        )
        var result = 0
        func ok(_ t: Int, _ l: Int, _ b: Int, _ r: Int) -> Bool {
            (r - l + 1) * (b - t + 1) == sums[b][r] - sums[b][l - 1] - sums[t - 1][r] + sums[t - 1][l - 1]
        }
        for i in 1..<sums.count {
            for j in 1..<sums[i].count {
                sums[i][j] = mat[i - 1][j - 1] + sums[i][j - 1] + sums[i - 1][j] - sums[i - 1][j - 1]
            }
        }
        for i in 1..<sums.count {
            for j in 1..<sums[i].count {
                var maxi = i
                while maxi < sums.count, ok(i, j, maxi, j) { maxi += 1 }
                var maxj = j
                while maxj < sums[i].count, ok(i, j, i, maxj) { maxj += 1 }
                for k in i..<maxi {
                    for l in j..<maxj
                    where ok(i, j, k, l) {
                        result += 1
                    }
                }
            }
        }
        return result
    }
    
    func tests() {
        print(numSubmat([[1,0,1],[1,1,0],[1,1,0]])) // 13
        print(numSubmat([[0,1,1,0],[0,1,1,1],[1,1,1,0]])) // 24
    }
}
