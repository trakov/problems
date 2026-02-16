final class BrickWall {
    func leastBricks(_ wall: [[Int]]) -> Int {
        var map: [Int: Int] = [:]
        var maxEdges = 0
        for row in wall where row.count > 1 {
            var width = row[0]
            for w in row.dropFirst() {
                map[width, default: 0] += 1
                maxEdges = max(maxEdges, map[width]!)
                width += w
            }
        }
        return wall.count - maxEdges
    }
    
    func tests() {
        print(leastBricks([[1,2,2,1],[3,1,2],[1,3,2],[2,4],[3,1,2],[1,3,1,1]])) // 2
        print(leastBricks([[1],[1],[1]])) // 3
    }
}
