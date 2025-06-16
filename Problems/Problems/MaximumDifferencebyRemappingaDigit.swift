final class MaximumDifferencebyRemappingaDigit {
    func minMaxDifference(_ num: Int) -> Int {
        var s = Array(String(num))
        var t = s
        var pos = 0
        let n = s.count
        func replace(_ s: inout [Character], _ x: Character, _ y: Character) {
            for i in 0..<n where s[i] == x {
                s[i] = y
            }
        }
        while pos < n && s[pos] == "9" {
            pos += 1
        }
        if pos < n {
            replace(&s, s[pos], "9")
        }
        replace(&t, t[0], "0")
        return Int(String(s))! - Int(String(t))!
    }
    
    func tests() {
        print(minMaxDifference(11891)) // 99009
        print(minMaxDifference(90)) // 99
    }
}
