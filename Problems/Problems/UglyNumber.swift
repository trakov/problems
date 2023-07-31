class UglyNumber {
    func isUgly(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        guard n != 1 else { return true }
        
        var num = n
        
        while num % 2 == 0 {
            num /= 2
        }
        while num % 3 == 0 {
            num /= 3
        }
        while num % 5 == 0 {
            num /= 5
        }

        return num == 1
    }

    func tests() {
        print(isUgly(6)) // true
        print(isUgly(1)) // true
        print(isUgly(30)) // true
        print(isUgly(14)) // false
        print(isUgly(-2147483648)) // false
    }
}
