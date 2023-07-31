class IntervalListIntersections {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        guard !firstList.isEmpty && !secondList.isEmpty else { return [] }
        var result: [[Int]] = []
        var i = 0
        var j = 0
        while i < firstList.count && j < secondList.count {
            let a = firstList[i]
            let b = secondList[j]
            if a[1] < b[0] {
                i += 1
            } else if b[1] < a[0] {
                j += 1
            } else {
                result.append([max(a[0], b[0]), min(a[1], b[1])])
                if a[1] > b[1] {
                    j += 1
                } else if b[1] > a[1] {
                    i += 1
                } else {
                    i += 1
                    j += 1
                }
            }
        }
        return result
    }

    func tests() {
        print(intervalIntersection(
            [[0,2],[5,10],[13,23],[24,25]], [[1,5],[8,12],[15,24],[25,26]]
        )) // [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
        print(intervalIntersection([[1,3],[5,9]], [])) // []
    }
}
