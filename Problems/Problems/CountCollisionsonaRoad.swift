final class CountCollisionsonaRoad {
    func countCollisions(_ directions: String) -> Int {
        var lastDir = "L"
        var rCount = 0
        var result = 0
        for dir in directions {
            switch dir {
            case "L":
                if lastDir == "R" {
                    result += 2 + max(rCount - 1, 0)
                    lastDir = "S"
                    rCount = 0
                } else if lastDir == "S" {
                    result += 1
                    lastDir = "S"
                }
            case "R":
                rCount += 1
                lastDir = "R"
            case "S":
                if lastDir == "R" {
                    result += 1 + max(rCount - 1, 0)
                    rCount = 0
                }
                lastDir = "S"
            default: fatalError()
            }
        }
        return result
    }
    
    func tests() {
        print(countCollisions("RLRSLL")) // 5
        print(countCollisions("LLRR")) // 0
    }
}
