class LexicographicalNumbers {
    func lexicalOrder(_ n: Int) -> [Int] {
        guard n > 9 else { return Array((1...n)) }
        var result = Array(repeating: 0, count: n)
        var curNum = 1
        for i in 0..<n {
            result[i] = curNum
            if curNum * 10 <= n {
                curNum *= 10
            } else {
                while curNum % 10 == 9 || curNum >= n {
                    curNum /= 10
                }
                curNum += 1
            }
        }
        return result
    }
    
    func tests() {
        print(lexicalOrder(13)) // [1,10,11,12,13,2,3,4,5,6,7,8,9]
        print(lexicalOrder(2)) // [1,2]
    }
}

