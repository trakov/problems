class ProductofTwoRunLengthEncodedArrays {
    func findRLEArray(_ encoded1: [[Int]], _ encoded2: [[Int]]) -> [[Int]] {
        var result: [[Int]] = []
        var (i, j) = (0, 0)
        var (k, l) = (0, 0)
        while i < encoded1.count && j < encoded2.count {
            let (n1, n2) = (encoded1[i][0], encoded2[j][0])
            let product = n1 * n2
            if !result.isEmpty && result[result.count - 1][0] == product {
                let min = min(encoded1[i][1] - k, encoded2[j][1] - l)
                result[result.count - 1][1] += min
                k += min
                l += min
            } else {
                result.append([n1 * n2, 1])
                k += 1
                l += 1
            }
            if k == encoded1[i][1] {
                k = 0; i += 1
            }
            if l == encoded2[j][1] {
                l = 0; j += 1
            }
        }
        return result
    }
    
    func tests() {
        print(findRLEArray([[1,3],[2,3]], [[6,3],[3,3]])) // [[6,6]]
        print(findRLEArray([[1,3],[2,1],[3,2]], [[2,3],[3,3]] ))
        // [[2,3],[6,1],[9,2]]
    }
}

