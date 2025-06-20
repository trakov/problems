final class MaximumManhattanDistanceAfterKChanges {
    func maxDistance(_ s: String, _ k: Int) -> Int {
        var (lat, long) = (0, 0)
        var result = 0
        for (i, c) in s.enumerated() {
            switch c {
            case "N": lat += 1
            case "S": lat -= 1
            case "E": long += 1
            case "W": long -= 1
            default: break
            }
            result = max(
                result,
                min(abs(lat) + abs(long) + k * 2, i + 1)
            )
        }
        return result
    }
    
    func tests() {
        print(maxDistance("NWSE", 1)) // 3
        print(maxDistance("NSWWEW", 3)) // 6
    }
}
