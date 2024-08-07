class AddStrings {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var num1 = num1
        var num2 = num2
        var result = ""
        var one = 0
        for _ in 0..<max(num1.count, num2.count) {
            let sum =
            (num1.popLast()?.wholeNumberValue ?? 0) +
            (num2.popLast()?.wholeNumberValue ?? 0) +
            one
            result.append(Character(String(sum % 10)))
            one = sum / 10
        }
        if one == 1 {
            result.append(Character("1"))
        }
        return String(result.reversed())
    }

    func addStrings2(_ num1: String, _ num2: String) -> String {
        var result = ""
        var remain = 0
        var temp1 = num1
        var temp2 = num2
        for _ in 0 ..< max(num1.count, num2.count) {
            let a = temp1.isEmpty ? 0 : Int(String(temp1.removeLast()))!
            let b = temp2.isEmpty ? 0 : Int(String(temp2.removeLast()))!
            result = String((a + b + remain) % 10) + result
            remain = (a + b + remain) / 10
        }
        return remain == 1 ? "1" + result : result
    }

    func tests() {
        print(addStrings("11", "123")) // "134"
        print(addStrings("456", "77")) // "533"
        print(addStrings("0", "0")) // "0"
        print(addStrings("99", "9")) // "108"
    }
}
