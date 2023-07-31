class HappyNumber {
    func isHappy(_ n: Int) -> Bool {
        var numbers: [Int] = []
        var temp = n
        while !numbers.contains(temp) {
            numbers.append(temp)
            var newTemp = 0
            while temp != 0 {
                var s = temp % 10
                newTemp += s * s
                temp /= 10
            }
            if newTemp == 1 {
                return true
            }
            temp = newTemp
        }
        
        return false
    }

    func tests() {
        print(isHappy(19)) // true
        print(isHappy(2)) // false
    }
}
