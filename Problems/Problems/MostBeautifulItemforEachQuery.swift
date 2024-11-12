class MostBeautifulItemforEachQuery {
    func maximumBeauty(_ items: [[Int]], _ queries: [Int]) -> [Int] {
        let items = items.sorted { $0[0] <= $1[0] }
        var filtered: [[Int]] = []
        var prev = items[0]
        for item in items.dropFirst() where item[1] > prev[1] {
            filtered.append(prev)
            prev = item
        }
        filtered.append(prev)
        func value(_ q: Int) -> Int {
            var left = 0
            var right = filtered.count - 1
            var res = 0
            while left <= right {
                let mid = (left + right) / 2
                let price = filtered[mid][0]
                if price == q {
                    return filtered[mid][1]
                } else if price > q {
                    right = mid - 1
                } else {
                    res = filtered[mid][1]
                    left = mid + 1
                }
            }
            return res
        }
        return queries.map { value($0) }
    }
    
    func tests() {
        print(maximumBeauty([[1,2],[3,2],[2,4],[5,6],[3,5]], [1,2,3,4,5,6]))
        // [2,4,5,5,6,6]
        print(maximumBeauty([[1,2],[1,2],[1,3],[1,4]], [1])) // [4]
        print(maximumBeauty([[10,1000]], [5])) // [0]
    }
}

