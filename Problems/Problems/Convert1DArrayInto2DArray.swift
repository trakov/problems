class Convert1DArrayInto2DArray {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        let count = original.count
        guard count == m * n else { return [] }
        var result = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<count {
            let k = i / n
            let l = i - k * n
            result[k][l] = original[i]
        }
        return result
    }
    
    func tests() {
        print(construct2DArray([1,2,3,4], 2, 2)) // [[1,2],[3,4]]
        print(construct2DArray([1,2,3], 1, 3)) // [[1,2,3]]
        print(construct2DArray([1,2], 1, 1)) // []
    }
}

