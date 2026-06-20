final class MaximumBuildingHeight {
    func maxBuilding(_ num: Int, _ restrictions: [[Int]]) -> Int {
        func yCap(_ l: [Int], _ b: [Int]) -> Int {
            min(b[1], l[1] + abs(b[0] - l[0]))
        }
        func yPeak(_ l: [Int], _ b: [Int]) -> Int {
            (l[1] + b[1] + b[0] - l[0]) >> 1
        }
        var r = restrictions + [[1, 0]]
        r.sort { $0[0] < $1[0] }
        let n = r.count
        for i in 1..<n {
            r[i][1] = yCap(r[i - 1], r[i])
        }
        for i in (0..<n-1).reversed() {
            r[i][1] = yCap(r[i + 1], r[i])
        }
        var res = 0
        for i in 1..<n {
            res = max(res, yPeak(r[i - 1], r[i]))
        }
        return max(res, r[n - 1][1] + num - r[n - 1][0])
    }

    func tests() {
        print(maxBuilding(5, [[2,1],[4,1]])) // 2
        print(maxBuilding(6, [])) // 5
        print(maxBuilding(10, [[5,3],[2,5],[7,4],[10,3]])) // 5
    }
}
