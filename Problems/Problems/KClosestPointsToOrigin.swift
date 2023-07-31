class KClosestPointsToOrigin {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var map: [Int: Int] = [:]
        func distance(of point: [Int]) -> Int {
            let key = point.sorted().map { abs($0) }.hashValue
            if map[key] == nil {
                map[key] = abs(point[1] * point[1] + point[0] * point[0])
            }
            return map[key]!
        }
        let distances = points.map {
            distance(of: $0)
        }
        return Array(zip(distances, points).sorted { one, two in
            one.0 < two.0
        }[0..<k].map { $1 })
    }
    
    func tests() {
        print(kClosest([[1,3],[-2,2]], 1)) // [[-2,2]]
        print(kClosest([[3,3],[5,-1],[-2,4]], 2)) // [[3,3],[-2,4]]
        print(kClosest([[2,2],[2,2],[2,2],[2,2],[2,2],[2,2],[1,1]], 1)) // [1,1]
    }
}

