class ImageSmoother {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        let n = img.count
        let m = img[0].count
        var result = img
        for x in 0..<n {
            for y in 0..<m {
                var s = 0
                var c = 0
                for i in (x - 1)...(x + 1) {
                    for j in (y - 1)...(y + 1) {
                        guard i >= 0 && i < n && j >= 0 && j < m else { continue }
                        s += img[i][j]
                        c += 1
                    }
                }
                result[x][y] = s / c
            }
        }
        return result
    }
    
    func tests() {
        print(imageSmoother([[6,9,7]])) // 7,7,8
        print(imageSmoother([[1]])) // 1
        print(imageSmoother([[1,1,1],[1,0,1],[1,1,1]]))
        // [[0,0,0],[0,0,0],[0,0,0]]
        print(imageSmoother([[1,1,1,1],[1,0,0,1],[1,1,1,1]]))
        // [[0,0,0],[0,0,0],[0,0,0]]
        print(imageSmoother([[100,200,100],[200,50,200],[100,200,100]]))
        // [[137,141,137],[141,138,141],[137,141,137]]
    }
}

