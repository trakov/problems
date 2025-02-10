class ClearDigits {
    func clearDigits(_ s: String) -> String {
        var count = 0
        var result = Array(s)
        for c in s {
            if c.isNumber {
                count = max(count - 1, 0)
            } else {
                result[count] = c
                count += 1
            }
        }
        return String(result[0..<count])
    }
    
    func tests() {
        print(clearDigits("abc")) // "abc"
        print(clearDigits("cb34")) // ""
        print(clearDigits("a8f")) // "f"
    }
}

