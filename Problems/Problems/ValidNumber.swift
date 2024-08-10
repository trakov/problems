class ValidNumber {
    func isNumber(_ s: String) -> Bool {
        let s = Array(s.lowercased())
        var pointSeen = false
        var eSeen = false
        var numberSeen = false
        var numberAfterE = true
        for (i, c) in s.enumerated() {
            if c >= "0" && c <= "9" {
                numberSeen = true
                numberAfterE = true
            } else if c == "." {
                if eSeen || pointSeen {
                    return false
                }
                pointSeen = true
            } else if c == "e" {
                if eSeen || !numberSeen {
                    return false
                }
                numberAfterE = false
                eSeen = true
            } else if c == "-" || c == "+" {
                if i > 0 && s[i-1] != "e" {
                    return false
                }
            } else {
                return false
            }
        }
        return numberSeen && numberAfterE
    }
    
    func tests() {
        print(isNumber("0")) // true
        print(isNumber("e")) // false
        print(isNumber(".")) // false
        print(isNumber("1E9")) // true
    }
}

