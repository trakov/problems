class FindKPairsWithSmallestSums {
    struct Pair: Hashable, Comparable {
        var p1: Int, p2: Int, sum: Int
        init(_ p1: Int, _ p2: Int, _ sum: Int) { self.p1 = p1; self.p2 = p2; self.sum = sum }
        static func < (lhs: Pair, rhs: Pair) -> Bool { lhs.sum < rhs.sum }
        static func == (lhs: Pair, rhs: Pair) -> Bool { lhs.p1 == rhs.p1 && lhs.p2 == rhs.p2 }
        func hash(into hasher: inout Hasher) { hasher.combine(p1); hasher.combine(p2) }
    }

    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        let m = nums1.count
        let n = nums2.count
        let k = min(k, n * m)
        var result = Array(repeating: Array(repeating: 0, count: 2), count: k)
        var visited: Set<[Int]> = []
        var minHeap: Heap<Pair> = Heap(sort: <)
        minHeap.insert(Pair(0, 0, nums1[0] + nums2[0]))
        visited.insert([0,0])
        var index = 0
        while index < k && !minHeap.isEmpty {
            let pair = minHeap.remove()!
            let i = pair.p1
            let j = pair.p2
            result[index] = [nums1[i], nums2[j]]
            index += 1
            if i + 1 < m && !visited.contains([i + 1, j]) {
                minHeap.insert(Pair(i + 1, j, nums1[i + 1] + nums2[j]))
                visited.insert([i + 1, j])
            }
            if j + 1 < n && !visited.contains([i, j + 1]) {
                minHeap.insert(Pair(i, j + 1, nums1[i] + nums2[j + 1]))
                visited.insert([i, j + 1])
            }
        }
        return result
    }

    func tests() {
        print(kSmallestPairs([1,7,11], [2,4,6], 3)) // [[1,2],[1,4],[1,6]]
        print(kSmallestPairs([1,1,2], [1,2,3], 2)) // [[1,1],[1,1]]
        print(kSmallestPairs([1,2], [3], 3)) // [[1,3],[2,3]]
    }
}

