final class MaximumNumberofItemsFromSaleII {
    func maximumSaleItems(_ items: [[Int]], _ budget: Int) -> Int {
        let items = items.sorted { $0[1] < $1[1] }
        var mx = 0
        for item in items {
            mx = max(mx, item[0])
        }
        var freq = Array(repeating: 0, count: mx + 1)
        for item in items {
            freq[item[0]] += 1
        }
        for i in 1...mx where freq[i] > 0 {
            if freq[i] > 0 {
                for j in stride(from: i * 2, through: mx, by: i) {
                    freq[i] += freq[j]
                }
            }
        }
        let mn = items[0][1]
        var result = 0
        var budget = budget
        for item in items {
            let (factor, price) = (item[0], item[1])
            if price - mn > mn {
                break
            }
            let cnt = freq[factor] - 1
            let take = min(cnt, budget / price)
            result += take * 2
            budget -= take * price
        }
        result += budget / mn
        return result
    }
    
    func tests() {
        print(maximumSaleItems([[1,6],[2,4],[3,5]], 19)) // 5
        print(maximumSaleItems([[2,8],[1,10],[6,6],[4,12],[5,20],[5,17]], 35)) // 7
    }
}
