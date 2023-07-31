class WhereWillTheBallFall {
    func findBall(_ grid: [[Int]]) -> [Int] {
        guard grid[0].count > 1 else { return [-1] }
        var res = Array(repeating: -1, count: grid[0].count)
        
        for ballIndex in 0..<res.count {
            var ball = ballIndex
            var line = 0
            while line < grid.count {
                if grid[line][ball] == 1 {
                    if ball == res.count - 1 { ball = -1; break }
                    if grid[line][ball+1] == -1 { ball = -1; break }
                    ball+=1
                } else {
                    if ball == 0 { ball = -1; break }
                    if grid[line][ball-1] == 1 { ball = -1; break }
                    ball-=1
                }
                line+=1
            }
            res[ballIndex] = ball
        }
        
        return res
    }

    func tests() {
        print(findBall([[1,1,1,-1,-1],[1,1,1,-1,-1],[-1,-1,-1,1,1],[1,1,1,1,-1],[-1,-1,-1,-1,-1]]))
        // [1,-1,-1,-1,-1]
        print(findBall([[-1]])) // [-1]
        print(findBall([[1,1,1,1,1,1],[-1,-1,-1,-1,-1,-1],[1,1,1,1,1,1],[-1,-1,-1,-1,-1,-1]]))
        // [0,1,2,3,4,-1]
    }
}
