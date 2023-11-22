class DiagonalTraverseII {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var result: [Int] = []
        var queue: [(Int, Int)] = [(0,0)]
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            result.append(nums[x][y])
            if y == 0 && x + 1 < nums.count {
                queue.append((x + 1, y))
            }
            if y + 1 < nums[x].count {
                queue.append((x, y + 1))
            }
        }
        return result
    }

    func findDiagonalOrderTLE(_ nums: [[Int]]) -> [Int] {
        var result: [Int] = []
        let count = nums.enumerated().reduce(0) {
            max($0, $1.offset + $1.element.count)
        }
        for i in 0..<count {
            for j in 0...i {
                guard i - j < nums.count else { continue }
                guard j < nums[i - j].count else { continue }
                result.append(nums[i - j][j])
            }
        }
        return result
    }
    
    func tests() {
        print(findDiagonalOrder([[1,2,3],[4,5,6],[7,8,9]])) // [1,4,2,7,5,3,8,6,9]
        print(findDiagonalOrder([[1,2,3,4,5],[6,7],[8],[9,10,11],[12,13,14,15,16]]))
        // [1,6,2,8,7,3,9,4,12,10,5,13,11,14,15,16]
    }
}

