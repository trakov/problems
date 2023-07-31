class PerfectNumber {
    func checkPerfectNumber(_ num: Int) -> Bool {
        guard num > 1 else { return false }
        var sum = 0
        
        for i in 1...num/2 {
            if num % i == 0 {
                sum += i
            }
        }
        
        return num == sum
    }

    func tests() {
        print(checkPerfectNumber(1)) // false
        print(checkPerfectNumber(2)) // false
        print(checkPerfectNumber(3)) // false
        print(checkPerfectNumber(28)) // true
        print(checkPerfectNumber(7)) // false
    }
}
