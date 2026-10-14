final class MaximizeSumofSquaresofDigits {
    func maxSumOfSquares(_ num: Int, _ sum: Int) -> String {
        var result: [Character] = Array(repeating: "0", count: num)
        var rest = sum
        for i in 0..<num {
            let val = min(rest, 9)
            rest -= val
            result[i] = Character(String(val))
        }
        guard rest == 0 else { return "" }
        return String(result)
    }
    
    func tests() {
        print(maxSumOfSquares(2, 3)) // "30"
        print(maxSumOfSquares(2, 17)) // "98"
        print(maxSumOfSquares(1, 10)) // ""
    }
}
