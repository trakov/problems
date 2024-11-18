class DefusetheBomb {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        let n = code.count
        var result = Array(repeating: 0, count: n)
        guard k != 0 else { return result }
        var val = 0
        let sign = k.signum()
        for i in 1...abs(k) {
            val += code[(i * sign + n) % n]
        }
        for (i, c) in code.enumerated() {
            result[i] = val
            if k > 0 {
                val += code[(i + k + 1) % n] - code[(i + 1) % n]
            } else {
                val += c - code[(i + k + n) % n]
            }
        }
        return result
    }
    
    func tests() {
        print(decrypt([5,7,1,4], 3)) // [12,10,16,13]
        print(decrypt([1,2,3,4], 0)) // [0,0,0,0]
        print(decrypt([2,4,9,3], -2)) // [12,5,6,13]
        print(decrypt([10,5,7,7,3,2,10,3,6,9,1,6], -4))
        // [22,26,22,28,29,22,19,22,18,21,28,19]
    }
}

