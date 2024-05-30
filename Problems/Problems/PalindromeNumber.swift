class PalindromeNumber {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x != 0 && x % 10 == 0) { return false }
        var y = x
        var new = 0
        while y > new {
            new = new * 10 + y % 10
            y /= 10
        }
        return new == y || new / 10 == y
    }

    func isPalindrome2(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        var y = x
        var new = 0
        while y > 0 {
            new = new * 10 + y % 10
            y /= 10
        }
        return new == x
    }
    
    func tests() {
        print(isPalindrome(121)) // true
        print(isPalindrome(-121)) // false
        print(isPalindrome(10)) // false
        print(isPalindrome(Int.max)) // false
        print(isPalindrome(9223372036854775799)) // false
    }
}

