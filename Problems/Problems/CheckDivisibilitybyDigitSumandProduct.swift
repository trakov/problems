final class CheckDivisibilitybyDigitSumandProduct {
    func checkDivisibility(_ n: Int) -> Bool {
        var (sum, product) = (0, 1)
        for c in String(n) {
            let d = Int(String(c))!
            sum += d
            product *= d
        }
        return n % (sum + product) == 0
    }
    
    func tests() {
        print(checkDivisibility(99)) // true
        print(checkDivisibility(23)) // false
    }
}
