class WalkingRobotSimulation {
    struct Point: Hashable {
        let x: Int
        let y: Int
    }
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var result = 0
        var set: Set<Point> = []
        for obstacle in obstacles {
            set.insert(Point(x: obstacle[0], y: obstacle[1]))
        }
        var start = Point(x: 0, y: 0)
        let dirs = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        var dirIndex = 0
        for command in commands {
            if command == -2 {
                dirIndex = (dirIndex - 1 + 4) % 4
            } else if command == -1 {
                dirIndex = (dirIndex + 1) % 4
            } else {
                let dir = dirs[dirIndex]
                var last = start
                for _ in 0..<command {
                    let next = Point(x: last.x + dir.0, y: last.y + dir.1)
                    guard !set.contains(next) else { break }
                    last = next
                }
                result = max(result, last.x * last.x + last.y * last.y)
                start = last
            }
        }
        return result
    }
    
    func tests() {
        print(robotSim([4,-1,3], [])) // 25
        print(robotSim([4,-1,4,-2,4], [[2,4]])) // 65
        print(robotSim([6,-1,-1,6], [])) // 36
    }
}

