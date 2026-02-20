final class SpecialBinaryString {
    func makeLargestSpecial(_ s: String) -> String {
        var count = 0
        var i = 0
        let s = Array(s)
        var res: [String] = []
        for (j, c) in s.enumerated() {
            count += c == "1" ? 1 : -1
            if count == 0 {
                res.append("1" + makeLargestSpecial(String(s[i+1...j])) + "0")
                i = j + 1
            }
        }
        return res.sorted().reversed().joined(separator: "")
    }
    
    func tests() {
        print(makeLargestSpecial("11011000")) // "11100100"
        print(makeLargestSpecial("10")) // "10"
        print(makeLargestSpecial("11100010")) // "11100010"
    }
}
