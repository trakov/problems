final class CheckIfDigitsAreEqualinStringAfterOperationsI {
    func hasSameDigits(_ s: String) -> Bool {
        var s = s.map { Int(String($0))! }
        while s.count > 2 {
            var temp = Array(repeating: 0, count: s.count - 1)
            for i in 0..<temp.count {
                temp[i] = (s[i] + s[i + 1]) % 10
            }
            s = temp
        }
        return s[0] == s[1]
    }
    
    func tests() {
        print(hasSameDigits("3902")) // true
        print(hasSameDigits("34789")) // false
    }
}
