final class MaximumScoreofNonoverlappingIntervals {
    func maximumWeight(_ intervals: [[Int]]) -> [Int] {
        let n = intervals.count
        var arr = Array(repeating: Array(repeating: 0, count: 4), count: n)
        for i in 0..<n {
            arr[i][0] = intervals[i][0]
            arr[i][1] = intervals[i][1]
            arr[i][2] = intervals[i][2]
            arr[i][3] = i
        }
        arr.sort { $0[1] < $1[1] }
        var dp = Array(repeating: Array(repeating: 0, count: 5), count: n + 1)
        var indices = Array(repeating: Array(repeating: [Int](), count: 5), count: n + 1)
        func binarySearch(_ arr: [[Int]], _ end: Int, _ target: Int) -> Int {
            var left = 0
            var right = end
            while left < right {
                let mid = (left + right) / 2
                if arr[mid][1] < target {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left
        }
        func compareLists(_ a: [Int], _ b: [Int]) -> Int {
            let minLen = min(a.count, b.count)
            for i in 0..<minLen {
                if a[i] != b[i] {
                    return a[i] < b[i] ? -1 : 1
                }
            }
            if a.count == b.count {
                return 0
            }
            return a.count < b.count ? -1 : 1
        }
        for i in 0..<n {
            let l = arr[i][0]
            let weight = arr[i][2]
            let idx = arr[i][3]
            let k = binarySearch(arr, i, l)
            for j in 1...4 {
                let s1 = dp[i][j]
                let s2 = dp[k][j - 1] + weight
                if s1 > s2 {
                    dp[i + 1][j] = dp[i][j]
                    indices[i + 1][j] = indices[i][j]
                    continue
                }
                var newIndex = indices[k][j - 1]
                newIndex.append(idx)
                newIndex.sort()
                if s1 == s2 && compareLists(indices[i][j], newIndex) < 0 {
                    newIndex = indices[i][j]
                }
                dp[i + 1][j] = s2
                indices[i + 1][j] = newIndex
            }
        }
        return indices[n][4]
    }

    func tests() {
        print(maximumWeight([[1,3,2],[4,5,2],[1,5,5],[6,9,3],[6,7,1],[8,9,1]])) // [2,3]
        print(maximumWeight([[5,8,1],[6,7,7],[4,7,3],[9,10,6],[7,8,2],[11,14,3],[3,5,5]])) // [1,3,5,6]
    }
}
