final class FlipSquareSubmatrixVertically {
    func reverseSubmatrix(_ grid: [[Int]], _ x: Int, _ y: Int, _ k: Int) -> [[Int]] {
        guard k > 1 else { return grid }
        var grid = grid
        for line in 0..<k/2 {
            let topRow = x + line
            let bottomRow = x + k - 1 - line
            for j in y..<y+k {
                (grid[topRow][j], grid[bottomRow][j]) = (grid[bottomRow][j], grid[topRow][j])
            }
        }
        return grid
    }
    
    func tests() {
        print(reverseSubmatrix(
            [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]], 1, 0, 3
        )) // [[1,2,3,4],[13,14,15,8],[9,10,11,12],[5,6,7,16]]
        print(reverseSubmatrix(
            [[3,4,2,3],[2,3,4,2]], 0, 2, 2
        )) // [[3,4,4,2],[2,3,2,3]]
    }
}
