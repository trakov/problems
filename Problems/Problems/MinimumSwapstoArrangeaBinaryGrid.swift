final class MinimumSwapstoArrangeaBinaryGrid {
    func minSwaps(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var pos = Array(repeating: -1, count: n)
        for (i, row) in grid.enumerated() {
            for (j, val) in row.enumerated().reversed() {
                if val == 1 {
                    pos[i] = j
                    break
                }
            }
        }
        var result = 0
        for i in 0..<n {
            var k = -1
            for j in i..<n {
                if pos[j] <= i {
                    result += j - i
                    k = j
                    break
                }
            }
            if k >= 0 {
                if i+1 <= k {
                    for j in (i+1...k).reversed() {
                        pos.swapAt(j, j - 1)
                    }
                }
            } else {
                return -1
            }
        }
        return result
    }
    
    func tests() {
        print(minSwaps([[0,0,1],[1,1,0],[1,0,0]])) // 3
        print(minSwaps([[0,1,1,0],[0,1,1,0],[0,1,1,0],[0,1,1,0]])) // -1
        print(minSwaps([[1,0,0],[1,1,0],[1,1,1]])) // 0
    }
}
