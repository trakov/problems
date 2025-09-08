final class ConvertIntegertotheSumofTwoNoZeroIntegers {
    func getNoZeroIntegers(_ n: Int) -> [Int] {
        var (a, b, tens) = (0, 0, 1)
        var n = n
        var d = 0
        while n > 0 {
            (n, d) = (n / 10, n % 10)
            if d == 0 {
                a += 5 * tens
                b += 5 * tens
                n -= 1
            } else if d == 1 && n >= 1 {
                a += 6 * tens
                b += 5 * tens
                n -= 1
            } else {
                a += (d - d / 2) * tens
                b += d / 2 * tens
            }
            tens *= 10
        }
        return [a, b]
    }
    
    func tests() {
        print(getNoZeroIntegers(2)) // [1,1]
        print(getNoZeroIntegers(11)) // [2,9]
    }
}
