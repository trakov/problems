class LeastNumberOfUniqueIntegersAfterKRemovals {
    func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
        let n = arr.count
        guard n > k else { return 0 }
        guard n > k - 1 else { return 1 }
        var map: [Int: Int] = [:] // num: count
        for num in arr {
            map[num, default: 0] += 1
        }
        var count = Array(repeating: 0, count: n + 1)
        for c in map.values {
            count[c] += 1
        }
        var result = map.count
        var k = k
        for (i, c) in count.enumerated().dropFirst() {
            guard k >= i else { break }
            let take = min(k / i, c)
            k -= take * i
            result -= take
        }
        return result
    }
    
    func findLeastNumOfUniqueInts2(_ arr: [Int], _ k: Int) -> Int {
        let n = arr.count
        guard n > k else { return 0 }
        guard n > k - 1 else { return 1 }
        var map: [Int: Int] = [:] // num: count
        for num in arr {
            map[num, default: 0] += 1
        }
        let count = map.sorted {
            $0.value < $1.value
        }.map { $0.value }
        var k = k
        var i = 0
        while k > 0 && count[i] <= k {
            k -= count[i]
            i += 1
        }
        return count.count - i
    }

    func tests() {
        print(findLeastNumOfUniqueInts([5,5,4], 1)) // 1
        print(findLeastNumOfUniqueInts([4,3,1,1,3,3,2], 3)) // 2
    }
}

