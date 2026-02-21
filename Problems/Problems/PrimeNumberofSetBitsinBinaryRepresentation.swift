final class PrimeNumberofSetBitsinBinaryRepresentation {
    func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
        let primeSet: Set<Int> = [2, 3, 5, 7, 11, 13, 17, 19]
        func isPrime(_ x: Int) -> Bool {
            primeSet.contains(x)
        }
        return (left...right).reduce(0) {
            $0 + (isPrime($1.nonzeroBitCount) ? 1 : 0)
        }
    }
    
    func tests() {
        print(countPrimeSetBits(6, 10)) // 4
        print(countPrimeSetBits(10, 15)) // 5
    }
}
