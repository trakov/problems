class PowerOfThree {
    func isPowerOfThree(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        guard n != 1 else { return true }
        
        var temp = 1
        while temp < n {
            temp *= 3
        }
        return temp == n
    }

    func tests() {
        print(isPowerOfThree(0)) // false
        print(isPowerOfThree(-1)) // false
        print(isPowerOfThree(1)) // true = 3**0
        print(isPowerOfThree(3)) // true = 3**1
        print(isPowerOfThree(27)) // true = 3**3
        print(isPowerOfThree(-27)) // false
    }
}
