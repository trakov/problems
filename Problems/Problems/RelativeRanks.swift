class RelativeRanks {
    func findRelativeRanks(_ score: [Int]) -> [String] {
        let n = score.count
        let sorted = score.enumerated().sorted { $0.1 > $1.1 }
        var result = Array(repeating: "", count: n)
        for (place, (origIndex, _)) in sorted.enumerated() {
            let str: String
            switch place {
            case 0: str = "Gold Medal"
            case 1: str = "Silver Medal"
            case 2: str = "Bronze Medal"
            default: str = "\(place + 1)"
            }
            result[origIndex] = str
        }
        return result
    }
    
    func findRelativeRanks2(_ score: [Int]) -> [String] {
        var array: [(Int, Int)] = [] // index, score
        for (i, s) in score.enumerated() {
            array.append((i, s))
        }
        array.sort { $0.1 > $1.1 }
        var result = Array(repeating: "", count: score.count)
        for (j, (i, _)) in array.enumerated() {
            var c = String(j + 1)
            if j == 0 {
                c = "Gold Medal"
            } else if j == 1 {
                c = "Silver Medal"
            } else if j == 2 {
                c = "Bronze Medal"
            }
            result[i] = c
        }
        return result
    }

    func tests() {
        print(findRelativeRanks([1]))
        print(findRelativeRanks([5,4,3,2,1])) // ["Gold Medal","Silver Medal","Bronze Medal","4","5"]
        print(findRelativeRanks([10,3,8,9,4])) // ["Gold Medal","5","Bronze Medal","Silver Medal","4"]
    }
}
