class CountandSay {
    func countAndSay(_ n: Int) -> String {
        if n == 1 { return "1" }
        let previous = countAndSay(n - 1)
        var prevChar = previous.first!
        var count = 0
        var result = ""
        for char in previous {
            if char == prevChar {
                count += 1
            } else {
                result += "\(count)\(prevChar)"
                count = 1
                prevChar = char
            }
        }
        return result + "\(count)\(prevChar)"
    }

    func countAndSay2(_ n: Int) -> String {
        var result: [Character] = ["1"]
        for _ in 1..<n {
            var temp: [Character] = []
            var count = 1
            for (i, c) in result.enumerated().dropFirst() {
                if result[i - 1] == c {
                    count += 1
                } else {
                    temp.append(contentsOf: String(count) + [result[i - 1]])
                    count = 1
                }
            }
            temp.append(contentsOf: String(count) + [result.last!])
            result = temp
        }
        return String(result)
    }
    
    func tests() {
        print(countAndSay(1)) // 1
        print(countAndSay(2)) // 11
        print(countAndSay(3)) // 21
        print(countAndSay(4)) // 1211
        print(countAndSay(5)) // 111221
        print(countAndSay(6)) // 312211
        print(countAndSay(7)) // 13112221
        print(countAndSay(8)) // 1113213211
        print(countAndSay(9)) // 31131211131221
        print(countAndSay(10)) // 13211311123113112211
    }
}

