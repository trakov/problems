class XORQueriesofaSubarray {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        let n = arr.count
        guard n > 0 else { return [] }
        var prefix = [0] + arr
        for i in 1...n {
            prefix[i] ^= prefix[i - 1]
        }
        var result = Array(repeating: 0, count: queries.count)
        for (i, query) in queries.enumerated() {
            result[i] = prefix[query[1] + 1] ^ prefix[query[0]]
        }
        return result
    }
    
    func tests() {
        print(xorQueries([1,3,4,8], [[0,1],[1,2],[0,3],[3,3]])) // [2,7,14,8]
        print(xorQueries([4,8,2,10], [[2,3],[1,3],[0,0],[0,3]])) // [8,0,4,4]
    }
}

