class LeftmostColumnwithatLeastaOne {
    class BinaryMatrix {
        private let matrix: [[Int]]
        init(_ matrix: [[Int]]) {
            self.matrix = matrix
        }
        func get(_ i: Int, _ j: Int) -> Int {
            matrix[i][j]
        }
        func dimensions() -> (Int, Int) {
            (matrix.count, matrix[0].count)
        }
    }
    
    func leftmostColumn(_ matrix: BinaryMatrix) -> Int {
        let (n, m) = matrix.dimensions()
        var index = Int.max
        var count = 0
        
        func binarySearch(_ i: Int) -> Int? { // first index of 1
            guard matrix.get(i, m - 1) == 1 else { return nil }
            var left = 0
            var right = m - 1
            while left < right {
                let mid = (left + right) / 2
                let midVal = matrix.get(i, mid)
                if midVal == 0 {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left
        }
        
        for i in 0..<n {
            guard let idx = binarySearch(i) else { continue }
            if idx < index {
                index = idx
                count = 1
            } else if idx == index {
                count += 1
            }
        }
        
        return count == 1 ? index : -1
    }
    
    func tests() {
        print(leftmostColumn(BinaryMatrix(
            [[0,0],[1,1]]
        ))) // 0
        print(leftmostColumn(BinaryMatrix(
            [[0,0],[0,1]]
        ))) // 1
        print(leftmostColumn(BinaryMatrix(
            [[0,0],[0,0]]
        ))) // -1
        print(leftmostColumn(BinaryMatrix(
            [[0,0,0,1],[0,0,1,1],[0,1,1,1]]
        ))) // 1
        print(leftmostColumn(BinaryMatrix(
            [[0,0,1,1],[0,0,1,1],[0,0,1,1]]
        ))) // -1
        print(leftmostColumn(BinaryMatrix(
            [[0,1,1,1],[0,1,1,1],[1,1,1,1]]
        ))) // 0
        print(leftmostColumn(BinaryMatrix(
            [[0,0,0,0,1],[0,0,0,1,1],[0,0,1,1,1]]
        ))) // 2
        print(leftmostColumn(BinaryMatrix(
            [[0,0,1,1,1],[0,0,1,1,1],[0,0,1,1,1]]
        ))) // -1
        print(leftmostColumn(BinaryMatrix(
            [[0,0,1,1,1],[0,0,1,1,1],[1,1,1,1,1]]
        ))) // 0
    }
}

