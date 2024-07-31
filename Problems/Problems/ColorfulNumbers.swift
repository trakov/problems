class ColorfulNumbers {
    func isColorful(_ num: Int) -> Bool {
        guard num > 9 else { return true }
        let digits = digits(of: num)
        let n = digits.count
        var set = Set(digits)
        guard set.count == n && !set.contains(0) && !set.contains(1) else {
            return false
        }
        for i in 0..<n-1 {
            var k = digits[i]
            for j in i+1..<n {
                k *= digits[j]
                guard set.insert(k).inserted else {
                    return false
                }
            }
        }
        return true
    }
    
    func digits(of num: Int) -> [Int] {
        var digits: [Int] = []
        var num = num
        while num > 0 {
            digits.append(num % 10)
            num /= 10
        }
        return digits.reversed()
    }
    
    func tests() {
        print(isColorful(3245)) // true
        print(isColorful(326)) // false
    }
}

