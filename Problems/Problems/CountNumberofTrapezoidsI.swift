final class CountNumberofTrapezoidsI {
    func countTrapezoids(_ points: [[Int]]) -> Int {
        let mod = 1_000_000_007
        var map: [Int: Int] = [:] // y: count
        for point in points {
            map[point[1], default: 0] += 1
        }
        var result = 0
        var sum = 0
        for count in map.values where count > 1 {
            let edge = count * (count - 1) / 2
            result = (result + edge * sum) % mod
            sum = (sum + edge) % mod
        }
        return result
    }
    
    func tests() {
        print(countTrapezoids([[1,0],[2,0],[3,0],[2,2],[3,2]])) // 3
        print(countTrapezoids([[0,0],[1,0],[0,1],[2,1]])) // 1
    }
}
