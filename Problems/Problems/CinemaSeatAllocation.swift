final class CinemaSeatAllocation {
    func maxNumberOfFamilies(_ n: Int, _ reservedSeats: [[Int]]) -> Int {
        var map: [Int: Set<Int>] = [:]
        for seat in reservedSeats {
            map[seat[0], default: []].insert(seat[1])
        }
        var result = 0
        for seats in map.values {
            var val = 0
            if seats.isDisjoint(with: [2,3,4,5]) {
                val += 1
            }
            if seats.isDisjoint(with: [6,7,8,9]) {
                val += 1
            }
            if val == 0 && seats.isDisjoint(with: [4,5,6,7]) {
                val = 1
            }
            result += val
        }
        return result + (n - map.count) * 2
    }
    
    func tests() {
        print(maxNumberOfFamilies(3, [[1,2],[1,3],[1,8],[2,6],[3,1],[3,10]])) // 4
        print(maxNumberOfFamilies(2, [[2,1],[1,8],[2,6]])) // 2
        print(maxNumberOfFamilies(4, [[4,3],[1,4],[4,6],[1,7]])) // 4
    }
}
