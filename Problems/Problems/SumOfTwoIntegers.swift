class SumOfTwoIntegers {
    func getSumRec(_ a: Int, _ b: Int) -> Int {
        b == 0 ? a : getSumRec(a ^ b, (a & b) << 1)
    }
    
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            (a, b) = (a ^ b, (a & b) << 1)
        }
        return a
    }
    
    func tests() {
        print(getSum(1, 2)) // 3
        print(getSum(2, 3)) // 5
    }
}

