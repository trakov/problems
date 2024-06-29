class MaximumTotalImportanceofRoads {
    func maximumImportance(_ n: Int, _ roads: [[Int]]) -> Int {
        var cities = Array(repeating: 0, count: n)
        for road in roads {
            cities[road[0]] += 1
            cities[road[1]] += 1
        }
        cities.sort()
        return cities.enumerated().reduce(0) {
            $0 + ($1.element * ($1.offset + 1))
        }
    }
    
    func tests() {
        print(maximumImportance(5, [[0,1],[1,2],[2,3],[0,2],[1,3],[2,4]])) // 43
        print(maximumImportance(5, [[0,3],[2,4],[1,3]])) // 20
    }
}

