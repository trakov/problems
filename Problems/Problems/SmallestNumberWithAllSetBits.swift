final class SmallestNumberWithAllSetBits {
    func smallestNumber(_ n: Int) -> Int {
        var i = 2
        while i <= n {
            i <<= 1
        }
        return i - 1
    }
    
    func tests() {
        print(smallestNumber(5)) // 7
        print(smallestNumber(10)) // 15
        print(smallestNumber(3)) // 3
        print(smallestNumber(4)) // 7
        print(smallestNumber(1)) // 1
    }
}
