final class DeleteColumnstoMakeSortedII {
    func minDeletionSize(_ strs: [String]) -> Int {
        let strs = strs.map(Array.init)
        let n = strs.count
        let m = strs[0].count
        var resolved = Array(repeating: false, count: n-1)
        var result = 0
        var unresolved = n - 1
        for col in 0..<m {
            guard unresolved > 0 else { break }
            var next = false
            for row in 0..<n-1 {
                if !resolved[row] && strs[row][col] > strs[row + 1][col] {
                    next = true
                    break
                }
            }
            if next {
                result += 1
                continue
            }
            for row in 0..<n-1 {
                if !resolved[row] && strs[row][col] < strs[row + 1][col] {
                    resolved[row] = true
                    unresolved -= 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(minDeletionSize(["ca","bb","ac"])) // 1
        print(minDeletionSize(["xc","yb","za"])) // 0
        print(minDeletionSize(["zyx","wvu","tsr"])) // 3
        print(minDeletionSize(["vdy","vei","zvc","zld"])) // 2
    }
}
