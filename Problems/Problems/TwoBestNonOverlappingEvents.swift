class TwoBestNonOverlappingEvents {
    func maxTwoEvents(_ events: [[Int]]) -> Int {
        var times: [[Int]] = []
        for event in events {
            times.append([event[0], 1, event[2]])
            times.append([event[1] + 1, 0, event[2]])
        }
        times.sort {
            $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]
        }
        var result = 0
        var maxValue = 0
        for timeValue in times {
            if timeValue[1] == 1 {
                result = max(result, timeValue[2] + maxValue)
            } else {
                maxValue = max(maxValue, timeValue[2])
            }
        }
        return result
    }
    
    func tests() {
        print(maxTwoEvents([[1,3,2],[4,5,2],[2,4,3]])) // 4
        print(maxTwoEvents([[1,3,2],[4,5,2],[1,5,5]])) // 5
        print(maxTwoEvents([[1,5,3],[1,5,1],[6,6,5]])) // 8
    }
}

