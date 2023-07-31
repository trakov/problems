class MultiplyStrings {
    func multiply(_ num1: String, _ num2: String) -> String {
        guard num1 != "0" && num2 != "0" else { return "0" }
        let num1 = num1.reversed().map { Int(String($0))! }
        let num2 = num2.reversed().map { Int(String($0))! }
        var result = Array(repeating: 0, count: num1.count + num2.count)
        for (i, n1) in num1.enumerated() {
            for (j, n2) in num2.enumerated() {
                let mult = n1 * n2
                let cur = result[j+i] + mult
                result[j+i] = cur % 10
                result[j+i+1] += cur / 10
            }
        }
        while result.last == 0 {
            result.removeLast()
        }
        return result.reversed().map { String($0) }.joined()
    }

    func multiply2(_ num1: String, _ num2: String) -> String {
        guard num1 != "0" && num2 != "0" else { return "0" }
        let num1 = Array(num1.reversed())
        let num2 = Array(num2.reversed())
        var result = Array(repeating: "0", count: num1.count + num2.count + 1)
        for i in (0..<num1.count) {
            let n1 = Int(String(num1[i]))!
            for j in (0..<num2.count) {
                let n2 = Int(String(num2[j]))!
                let mult = n1 * n2
                let cur = Int(result[j+i])! + Int(result[j+i+1])!*10 + Int(result[j+i+2])!*100 + mult
                result[j+i] = String(cur % 10)
                result[j+i+1] = String((cur / 10) % 10)
                result[j+i+2] = String((cur / 10) / 10)
            }
        }
        result.reverse()
        while result[0] == "0" {
            result.removeFirst()
        }
        return result.joined()
    }

    func tests() {
        print(multiply("9", "99")) // 9801
        print(multiply("99", "99")) // 9801
        print(multiply("999", "999")) // 998001
        print(multiply("2", "3")) // "6"
        print(multiply("20", "30")) // "600"
        print(multiply("50", "50")) // "2500"
        print(multiply("123", "456")) // "56088"
        print(multiply("12", "98")) // "1176"
    }
}
