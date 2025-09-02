final class FindtheNumberofWaystoPlacePeopleI {
    func numberOfPairs(_ points: [[Int]]) -> Int {
        var result = 0
        let n = points.count
        for (i, pointA) in points.enumerated() {
            for (j, pointB) in points.enumerated() where i != j {
                if pointA[0] > pointB[0] || pointA[1] < pointB[1] {
                    continue
                }
                if n == 2 {
                    result += 1
                    continue
                }
                var illegal = false
                for (k, p) in points.enumerated() where k != i && k != j {
                    let isXContained = p[0] >= pointA[0] && p[0] <= pointB[0]
                    let isYContained = p[1] <= pointA[1] && p[1] >= pointB[1]
                    if isXContained && isYContained {
                        illegal = true
                        break
                    }
                }
                if !illegal {
                    result += 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(numberOfPairs([[1,1],[2,2],[3,3]])) // 0
        print(numberOfPairs([[6,2],[4,4],[2,6]])) // 2
        print(numberOfPairs([[3,1],[1,3],[1,1]])) // 2
    }
}
