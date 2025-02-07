class FindtheNumberofDistinctColorsAmongtheBalls {
    func queryResults(_ limit: Int, _ queries: [[Int]]) -> [Int] {
        var balls: [Int: Int] = [:] // ball: color
        var colors: [Int: Int] = [:] // color: ballsCount
        let n = queries.count
        var result = Array(repeating: 0, count: n)
        for (i, query) in queries.enumerated() {
            let ball = query[0]
            let color = query[1]
            if let ballColor = balls[ball] {
                if let ballsCount = colors[ballColor], ballsCount > 1 {
                    colors[ballColor] = ballsCount - 1
                } else {
                    colors[ballColor] = nil
                }
            }
            colors[color, default: 0] += 1
            balls[ball] = color
            result[i] = colors.count
        }
        return result
    }
    
    func tests() {
        print(queryResults(4, [[1,4],[2,5],[1,3],[3,4]])) // [1,2,2,3]
        print(queryResults(4, [[0,1],[1,2],[2,2],[3,4],[4,5]])) // [1,2,2,3,4]
    }
}

