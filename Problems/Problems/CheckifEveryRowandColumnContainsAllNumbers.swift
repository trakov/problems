class CheckifEveryRowandColumnContainsAllNumbers {
    func checkValid(_ matrix: [[Int]]) -> Bool {
        var columns = [Int: [Int]]()
        for i in 0 ..< matrix.count {
            var result: [Int] = []
            for j in 0 ..< matrix[i].count {
                let value = matrix[i][j]
                if result.contains(value) {
                    return false
                }
                if columns[j]?.contains(value) ?? false {
                    return false
                }
                result.append(value)
                columns[j, default: []] += [value]
            }
        }
        return true
    }

    func tests() {
        print(checkValid([[1,2,3],[3,1,2],[2,3,1]])) // true
        print(checkValid([[1,1,1],[1,2,3],[1,2,3]])) // false
        print(checkValid([[1,2,3],[1,2,3],[1,2,3]])) // false
    }
}
