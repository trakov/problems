class FindBuildingWhereAliceandBobCanMeet {
    func leftmostBuildingQueries(_ heights: [Int], _ queries: [[Int]]) -> [Int] {
        var monoStack: [(Int, Int)] = []
        var result = Array(repeating: -1, count: queries.count)
        var newQueries = Array(repeating: [(Int, Int)](), count: heights.count)
        for (i, q) in queries.enumerated() {
            var (a, b) = (q[0], q[1])
            if a > b { (a, b) = (b, a) }
            if heights[b] > heights[a] || a == b {
                result[i] = b
            } else {
                newQueries[b].append((heights[a], i))
            }
        }
        
        func search(_ height: Int) -> Int {
            var (left, right) = (0, monoStack.count - 1)
            var ans = -1
            while left <= right {
                let mid = (left + right) / 2
                if monoStack[mid].0 > height {
                    ans = max(ans, mid)
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            return ans
        }

        for (i, (q, h)) in zip(newQueries, heights).enumerated().reversed() {
            let monoStackSize = monoStack.count
            for pair in q {
                let position = search(pair.0)
                if position < monoStackSize && position >= 0 {
                    result[pair.1] = monoStack[position].1
                }
            }
            while !monoStack.isEmpty && monoStack[monoStack.count - 1].0 <= h {
                monoStack.remove(at: monoStack.count - 1)
            }
            monoStack.append((h, i))
        }
        return result
    }

    func tests() {
        print(leftmostBuildingQueries([6,4,8,5,2,7], [[0,1],[0,3],[2,4],[3,4],[2,2]]))
        // [2,5,-1,5,2]
        print(leftmostBuildingQueries([5,3,8,2,6,1,4,6], [[0,7],[3,5],[5,2],[3,0],[1,6]]))
        // [7,6,-1,4,6]
    }
}

