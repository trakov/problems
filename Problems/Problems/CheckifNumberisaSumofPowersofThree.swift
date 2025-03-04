class CheckifNumberisaSumofPowersofThree {
    func checkPowersOfThree(_ n: Int) -> Bool {
        var n = n
        while n > 0 {
            if n % 3 == 2 {
                return false
            }
            n /= 3
        }
        return true
    }
    
    func tests() {
        print(checkPowersOfThree(12)) // true
        print(checkPowersOfThree(91)) // true
        print(checkPowersOfThree(21)) // false
    }
}

