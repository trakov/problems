class PowerOfFour {
    func isPowerOfFour(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        var n = n
        while n % 4 == 0 {
            n /= 4
        }
        return n == 1
    }
    
    func tests() {
        print(isPowerOfFour(16)) // true
        print(isPowerOfFour(5)) // false
        print(isPowerOfFour(1)) // true
        print(isPowerOfFour(0)) // false
    }
}
