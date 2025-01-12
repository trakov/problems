class CheckifaParenthesesStringCanBeValid {
    func canBeValid(_ s: String, _ locked: String) -> Bool {
        let n = s.count
        guard n % 2 == 0 else { return false }
        var openBrackets = 0
        var unlocked = 0
        for (c, lock) in zip(s, locked) {
            guard lock == "1" else {
                unlocked += 1
                continue
            }
            if c == "(" {
                openBrackets += 1
            } else {
                if openBrackets > 0 {
                    openBrackets -= 1
                } else if unlocked > 0 {
                    unlocked -= 1
                } else {
                    return false
                }
            }
        }
        var balance = 0
        for (c, lock) in zip(s, locked).reversed() {
            if lock == "0" {
                balance -= 1
                unlocked -= 1
            } else if c == "(" {
                balance += 1
                openBrackets -= 1
            } else if c == ")" {
                balance -= 1
            }
            if balance > 0 {
                return false
            }
            if unlocked == 0 && openBrackets == 0 {
                break
            }
        }
        return openBrackets <= 0
    }
    
    func tests() {
        print(canBeValid("))()))", "010100")) // true
        print(canBeValid("()()", "0000")) // true
        print(canBeValid(")", "0")) // false
    }
}

