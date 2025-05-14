final class TotalCharactersinStringAfterTransformationsII {
    func lengthAfterTransformations(_ s: String, _ t: Int, _ nums: [Int]) -> Int {
        let mod = 1_000_000_007
        var M = Array(repeating: Array(repeating: 0, count: 26), count: 26)
        for (i, k) in nums.enumerated() {
            for j in (i + 1)...(i + k) {
                M[i][j % 26] = 1
            }
        }
        let Mt = matPow(M, t, mod)
        var count = Array(repeating: 0, count: 26)
        for c in s {
            let index = Int(c.asciiValue! - Character("a").asciiValue!)
            count[index] += 1
        }
        let res = matMul([count], Mt, mod)
        return res[0].reduce(0, +) % mod
    }
    
    func matMul(_ mat1: [[Int]], _ mat2: [[Int]], _ mod: Int) -> [[Int]] {
        var res = Array(repeating: Array(repeating: 0, count: mat2[0].count), count: mat1.count)
        for i in 0..<mat1.count {
            for j in 0..<mat2[0].count {
                for k in 0..<mat2.count {
                    res[i][j] += mat1[i][k] * mat2[k][j]
                    res[i][j] %= mod
                }
            }
        }
        return res
    }

    func matPow(_ mat: [[Int]], _ n: Int, _ mod: Int) -> [[Int]] {
        let size = mat.count
        var res = Array(repeating: Array(repeating: 0, count: size), count: size)
        for i in 0..<size {
            res[i][i] = 1
        }
        var n = n
        var mat = mat
        while n > 0 {
            if n & 1 == 1 {
                res = matMul(res, mat, mod)
            }
            mat = matMul(mat, mat, mod)
            n >>= 1
        }
        return res
    }
    
    func tests() {
        print(lengthAfterTransformations("abcyy", 2, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2])) // 7
        print(lengthAfterTransformations("azbk", 1, [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2])) // 8
    }
}
