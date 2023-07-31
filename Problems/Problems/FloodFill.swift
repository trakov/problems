class FloodFill {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        guard image[sr][sc] != color else { return image }
        let oldColor = image[sr][sc]
        var result = image
        fill(&result, sr, sc, oldColor, color)
        return result
    }
    
    func fill(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ oldColor: Int, _ color: Int) {
        guard sr >= 0 && sc >= 0 && sr < image.count && sc < image[0].count else { return }
        guard image[sr][sc] == oldColor else { return }
        image[sr][sc] = color
        fill(&image, sr-1, sc, oldColor, color)
        fill(&image, sr+1, sc, oldColor, color)
        fill(&image, sr, sc-1, oldColor, color)
        fill(&image, sr, sc+1, oldColor, color)
    }

    func tests() {
        print(floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)) // [[2,2,2],[2,2,0],[2,0,1]]
        print(floodFill([[0,0,0],[0,0,0]], 0, 0, 0)) // [[0,0,0],[0,0,0]]
    }
}
