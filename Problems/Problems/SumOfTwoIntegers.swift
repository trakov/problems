class SumOfTwoIntegers {
    func getSum(_ a: Int, _ b: Int) -> Int {
        b == 0 ? a : getSum(a ^ b, (a & b) << 1)
    }
    
    func tests() {
        print(getSum(1, 2)) // 3
        print(getSum(2, 3)) // 5
    }
}

