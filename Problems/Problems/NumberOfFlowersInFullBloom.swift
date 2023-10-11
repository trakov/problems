class NumberOfFlowersInFullBloom {
    func fullBloomFlowers(_ flowers: [[Int]], _ people: [Int]) -> [Int] {
        var events: [[Int]] = []
        for flower in flowers {
            let start = flower[0]
            let end = flower[1]
            events.append([start, 0, 1])
            events.append([end + 1, 0, -1])
        }
        for (index, person) in people.enumerated() {
            events.append([person, 1, index])
        }
        events.sort { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
        var result = Array(repeating: 0, count: people.count)
        var current = 0
        for eve in events {
            let time = eve[0]
            let eventype = eve[1]
            let d = eve[2]
            if eventype == 0 {
                current += d
            } else {
                result[d] = current
            }
        }
        return result
    }
    
    func tests() {
        print(fullBloomFlowers([[1,6],[3,7],[9,12],[4,13]], [2,3,7,11])) // [1,2,2,2]
        print(fullBloomFlowers([[1,10],[3,3]], [3,3,2])) // [2,2,1]
    }
}

