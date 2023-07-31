class MinimumFallingPathSum {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        guard matrix.count > 1 else { return matrix[0][0] }
        var candidates = matrix[0]
        var tempCandidates = candidates
        for i in 1..<matrix.count {
            tempCandidates = candidates
            for j in 0..<matrix.count {
                var localMin = Int.max
                for k in max(0, j - 1)...min(tempCandidates.count-1, j + 1) {
                    localMin = min(localMin, tempCandidates[k])
                }
                candidates[j] = localMin + matrix[i][j]
            }
        }
        
        return candidates.min()!
    }

    func tests() {
        print(minFallingPathSum([[2,1,3],[6,5,4],[7,8,9]])) // 13
        print(minFallingPathSum([[-19,57],[-40,-5]])) // -59
    }
}
