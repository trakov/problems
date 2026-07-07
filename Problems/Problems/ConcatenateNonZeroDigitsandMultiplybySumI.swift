final class ConcatenateNonZeroDigitsandMultiplybySumI {
    func sumAndMultiply(_ n: Int) -> Int {
        var x = 0
        var sum = 0
        for k in String(n).map({ $0.wholeNumberValue! }) where k != 0 {
            x = x * 10 + k
            sum += k
        }
        return x * sum
    }
    
    func tests() {
        print(sumAndMultiply(10203004)) // 12340
        print(sumAndMultiply(1000)) // 1
    }
}
