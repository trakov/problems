class GrayCode {
    func grayCode(_ n: Int) -> [Int] {
        var result = Array(repeating: 0, count: 1<<n)
        for i in 0..<result.count {
            result[i] = i ^ (i >> 1)
        }
        return result
    }
    
    func tests() {
        print(grayCode(2)) // [0,1,3,2]
        print(grayCode(1)) // [0,1]
        print(grayCode(0)) // [0]
    }
}

