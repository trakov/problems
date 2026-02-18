final class BinaryNumberwithAlternatingBits {
    func hasAlternatingBits(_ n: Int) -> Bool {
        var one = n % 2
        var n = n
        while n > 0 {
            n /= 2
            guard one != n % 2 else { return false }
            one = n % 2
        }
        return true
    }
    
    func tests() {
        print(hasAlternatingBits(5)) // true
        print(hasAlternatingBits(7)) // false
        print(hasAlternatingBits(11)) // false
    }
}
