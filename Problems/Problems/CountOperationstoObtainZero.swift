final class CountOperationstoObtainZero {
    func countOperations(_ num1: Int, _ num2: Int) -> Int {
        var (num1, num2) = (num1, num2)
        var count = 0
        while num1 != 0 && num2 != 0 {
            count += num1 / num2
            num1 %= num2
            (num1, num2) = (num2, num1)
        }
        return count
    }
    
    func tests() {
        print(countOperations(2, 3)) // 3
        print(countOperations(10, 10)) // 1
    }
}
