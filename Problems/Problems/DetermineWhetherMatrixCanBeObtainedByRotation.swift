class DetermineWhetherMatrixCanBeObtainedByRotation {
    func findRotation(_ mat: [[Int]], _ target: [[Int]]) -> Bool {
        var (a, b, c, d) = (true, true, true, true)
        let n = mat.count
        for i in 0..<n {
            for j in 0..<n {
                let val = target[i][j]
                if a && mat[i][j] != val { a = false }
                if b && mat[j][n-i-1] != val { b = false }
                if c && mat[n-i-1][n-j-1] != val { c = false }
                if d && mat[n-j-1][i] != val { d = false }
                guard a || b || c || d else { return false }
            }
        }
        return true
    }

    func tests() {
        print(findRotation([[0,1],[1,0]], [[1,0],[0,1]])) // true
        print(findRotation([[0,1],[1,1]], [[1,0],[0,1]])) // false
        print(findRotation([[0,0,0],[0,1,0],[1,1,1]], [[1,1,1],[0,1,0],[0,0,0]])) // true
    }
}
