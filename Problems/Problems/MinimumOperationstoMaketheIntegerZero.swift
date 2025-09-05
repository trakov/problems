final class MinimumOperationstoMaketheIntegerZero {
    func makeTheIntegerZero(_ num1: Int, _ num2: Int) -> Int {
        var k = 1
        while true {
            let x = num1 - num2 * k
            if x < k {
                return -1
            }
            if k >= x.nonzeroBitCount {
                return k
            }
            k += 1
        }
    }
    
    func tests() {
        print(makeTheIntegerZero(3, -2)) // 3
        print(makeTheIntegerZero(5, 7)) // -1
    }
}
