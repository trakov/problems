class StringtoIntegeratoi {
    func myAtoi(_ s: String) -> Int {
        var sign = 1
        var result = 0
        var index = 0
        let n = s.count
        let s = Array(s)
        while index < n && s[index] == " " {
            index += 1
        }
        if index < n && s[index] == "+" {
            sign = 1
            index += 1
        } else if index < n && s[index] == "-" {
            sign = -1
            index += 1
        }
        while index < n, let digit = s[index].wholeNumberValue {
            if (
                result > Int32.max / 10 ||
                (result == Int32.max / 10 && digit > Int32.max % 10)
            ) {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }
            result = 10 * result + digit
            index += 1
        }
        return sign * result
    }
    
    func tests() {
        print(myAtoi("42")) // 42
        print(myAtoi("-042")) // -42
        print(myAtoi("1337c0d3")) // 1337
        print(myAtoi("0-1")) // 0
        print(myAtoi("words and 987")) // 0
    }
}

