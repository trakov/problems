class PathCrossing {
    struct Point: Hashable {
        var x: Int
        var y: Int
    }
    
    func isPathCrossing(_ path: String) -> Bool {
        var current = Point(x: 0, y: 0)
        var set: Set<Point> = [current]
        for c in path {
            switch c {
            case "N": current.y += 1
            case "E": current.x -= 1
            case "S": current.y -= 1
            case "W": current.x += 1
            default: fatalError()
            }
            if !set.insert(current).inserted {
                return true
            }
        }
        return false
    }
    
    func tests() {
        print(isPathCrossing("NES")) // false
        print(isPathCrossing("NESWW")) // true
    }
}

