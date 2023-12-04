class Largest3SameDigitNumberInString {
    func largestGoodInteger(_ num: String) -> String {
        guard num.count > 2 else { return "" }
        var resultChar: Character = "."
        var count = 1
        var cur = num.first!
        for char in num.dropFirst() {
            if char != cur {
                cur = char
                count = 1
            } else {
                if count == 2 {
                    resultChar = max(resultChar, char)
                } else {
                    count += 1
                }
            }
        }
        guard resultChar != "." else { return "" }
        return String(repeating: resultChar, count: 3)
    }
    
    func tests() {
        print(largestGoodInteger("6777133339")) // "777"
        print(largestGoodInteger("2300019")) // "000"
        print(largestGoodInteger("42352338")) // ""
    }
}

