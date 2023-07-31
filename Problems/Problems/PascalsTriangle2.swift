class PascalsTriangle2 {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 { return [1] }
        if rowIndex == 1 { return [1, 1] }
        var result: [Int] = [1]
        for _ in 0 ..< rowIndex {
            var current = 1
            let size = result.count
            for j in 1 ..< size {
                let temp = result[j]
                result[j] = current + temp
                current = temp
            }
            result.append(1)
        }
        return result
    }

    func tests() {
        print(getRow(0)) // 1
        print(getRow(1)) // 1, 1
        print(getRow(2)) // 1, 2, 1
        print(getRow(3)) // 1, 3, 3, 1
        print(getRow(4)) // 1, 4, 6, 4, 1
        print(getRow(5)) // 1, 5, 10, 10, 5, 1
//        print(generate(1))
//        print(generate(5)) // [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
    }
}
