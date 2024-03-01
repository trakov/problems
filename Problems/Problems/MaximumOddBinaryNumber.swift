class MaximumOddBinaryNumber {
    func maximumOddBinaryNumber(_ s: String) -> String {
        let n = s.count
        var ones = 0
        for c in s where c == "1" {
            ones += 1
        }
        var result = Array(repeating: Character("0"), count: n)
        result[n - 1] = "1"
        for i in 0..<ones-1 {
            result[i] = "1"
        }
        return String(result)
    }
    
    func tests() {
        print(maximumOddBinaryNumber("010")) // "001"
        print(maximumOddBinaryNumber("0101")) // "1001"
    }
}

