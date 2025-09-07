final class FindNUniqueIntegersSumuptoZero {
    func sumZero(_ n: Int) -> [Int] {
        var result = Array(repeating: 0, count: n)
        guard n > 1 else { return result }
        for i in 0..<n/2 {
            result[i] = -(i + 1)
            result[n - i - 1] = i + 1
        }
        return result
    }
    
    func tests() {
        print(sumZero(5)) // [-7,-1,1,3,4]
        print(sumZero(3)) // [-1,0,1]
        print(sumZero(4)) // [-1,1,-2,2]
        print(sumZero(1)) // [0]
    }
}
