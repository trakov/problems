final class ImageOverlap {
    func largestOverlap(_ img1: [[Int]], _ img2: [[Int]]) -> Int {
        let n = img1.count
        var i1: [[Int]] = []
        var i2: [[Int]] = []
        for i in 0..<n {
            for j in 0..<n {
                if img1[i][j] == 1 { i1.append([i ,j]) }
                if img2[i][j] == 1 { i2.append([i, j]) }
            }
        }
        var count = Array(repeating: Array(repeating: 0, count: 2 * n), count: 2 * n)
        var result = 0
        for a in i1 {
            for b in i2 {
                let dx = b[0] - a[0] + n
                let dy = b[1] - a[1] + n
                count[dx][dy] += 1
                result = max(result, count[dx][dy])
            }
        }
        return result
    }
    
    func tests() {
        print(largestOverlap([[1,1,0],[0,1,0],[0,1,0]], [[0,0,0],[0,1,1],[0,0,1]])) // 3
        print(largestOverlap([[1]], [[1]])) // 1
        print(largestOverlap([[0]], [[0]])) // 0
    }
}
