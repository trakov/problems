class SearchA2DMatrix {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 else { return false }
        if matrix.count == 1 && matrix[0].count == 1 { return matrix[0][0] == target }
        guard target >= matrix[0][0] else { return false }
        guard target <= matrix.last!.last! else { return false }
        var left = 0
        var right = matrix.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if target > matrix[mid].last! {
                left = mid + 1
            } else if target < matrix[mid].first! {
                right = mid - 1
            } else {
                left = mid
                break
            }
        }
        let row = matrix[left]
        if target >= row[0] && target <= row.last! {
            left = 0
            right = row.count - 1
            while left <= right {
                let mid = (left + right) / 2
                if target < row[mid] {
                    right = mid - 1
                } else if target > row[mid] {
                    left = mid + 1
                } else {
                    return true
                }
            }
        }
        return false
    }
    
    func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 else { return false }
        if matrix.count == 1 && matrix[0].count == 1 { return matrix[0][0] == target }
        guard matrix[0][0] <= target else { return false}
        var left = 0
        var right = 0
        for row in matrix {
            if target >= row[0] && target <= row.last! {
                left = 0
                right = row.count - 1
                while left <= right {
                    let mid = (left + right) / 2
                    if target < row[mid] {
                        right = mid - 1
                    } else if target > row[mid] {
                        left = mid + 1
                    } else {
                        return true
                    }
                }
            }
        }
        return false
    }

    func tests() {
        print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)) // true
        print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)) // false
        print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 22)) // false
    }
}
