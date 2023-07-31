class CountNegativeNumbersInASortedMatrix {
    func countNegatives(_ grid: [[Int]]) -> Int {
        var result = 0
        var left = 0
        var right = grid[0].count - 1
        for row in grid {
            while left <= right {
                let mid = (left + right) / 2
                if row[mid] >= 0 {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            result += (row.count - left)
            left = 0
        }
        return result
    }

    func tests() {
        print(countNegatives([[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]])) // 8
        print(countNegatives([[3,2],[1,0]])) // 0
    }
}
