final class FractiontoRecurringDecimal {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        var num = numerator, den = denominator
        var result: [String] = []
        guard num != 0 else { return "0" }
        if (num > 0 && den < 0) || (num < 0 && den > 0) {
            result.append("-")
        }
        num = abs(num)
        den = abs(den)
        result.append(String(num/den))
        num %= den
        guard num != 0 else { return result.joined() }
        result.append(".")
        var map = [Int:Int]()
        map[num] = result.count
        while num != 0 {
            num *= 10
            result.append(String(num / den))
            num %= den
            if let value = map[num] {
                let index = value
                result.insert("(", at: index)
                result.append(")")
                break
            } else {
                map[num] = result.count
            }
        }
        return result.joined()
    }
    
    func tests() {
        print(fractionToDecimal(1, 2)) // "0.5"
        print(fractionToDecimal(2, 1)) // "2"
        print(fractionToDecimal(4, 333)) // "0.(012)"
    }
}
