class CountSubstringsThatSatisfyKConstraintI {
    func countKConstraintSubstrings(_ s: String, _ k: Int) -> Int {
        let n = s.count
        let s = s.map { Int(String($0))! }
        var result = 0
        var left = 0
        var right = 0
        var ones = 0
        while right < n {
            ones += s[right]
            while ones > k && (right - left + 1 - ones) > k {
                ones -= s[left]
                left += 1
            }
            result += (right - left + 1)
            right += 1
        }
        return result
    }
    
    func tests() {
        print(countKConstraintSubstrings("10101", 1)) // 12
        print(countKConstraintSubstrings("1010101", 2)) // 25
        print(countKConstraintSubstrings("11111", 1)) // 15
        print(countKConstraintSubstrings("0011", 1)) // 9
    }
}

