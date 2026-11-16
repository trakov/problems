final class CalculateDigitSumofaString {
    func digitSum(_ s: String, _ k: Int) -> String {
        var s = Array(s)
        while s.count > k {
            var next: [Character] = []
            let n = s.count
            for i in stride(from: 0, to: s.count, by: k) {
                var val = 0
                for j in i..<min(i + k, n) {
                    val += s[j].wholeNumberValue!
                }
                next.append(contentsOf: String(val))
            }
            s = next
        }
        return String(s)
    }
    
    func tests() {
        print(digitSum("11111222223", 3)) // 135
        print(digitSum("00000000", 3)) // 000
    }
}
