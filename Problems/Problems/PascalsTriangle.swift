class PascalsTriangle {
    func generate(_ n: Int) -> [[Int]] {
        var result = [[1]]
        guard n > 1 else { return result }
        for i in 2...n {
            var line = Array(repeating: 1, count: i)
            for j in 1..<i-1 {
                line[j] = result[i - 2][j - 1] + result[i - 2][j]
            }
            result.append(line)
        }
        return result
    }

    func generate2(_ numRows: Int) -> [[Int]] {
        var result: [[Int]] = []
        
        while result.count != numRows {
            guard let lastRow = result.last else { result.append([1]); continue }
            var newRow = [1]
            for index in 1 ..< lastRow.count {
                newRow.append(lastRow[index - 1] + lastRow[index])
            }
            newRow.append(1)
            result.append(newRow)
        }
        
        return result
    }
    
    func getRow(_ rowIndex: Int) -> [Int] {
        var result: [[Int]] = []
        
        let numRows = rowIndex + 1
        
        while result.count != numRows {
            guard let lastRow = result.last else { result.append([1]); continue }
            var newRow = [1]
            for index in 1 ..< lastRow.count {
                newRow.append(lastRow[index - 1] + lastRow[index])
            }
            newRow.append(1)
            result.append(newRow)
        }
        
        return result.last!
    }

    func tests() {
        print(generate(1))
        print(generate(2))
        print(generate(5)) // [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
    }
}
