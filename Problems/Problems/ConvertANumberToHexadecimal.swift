class ConvertANumberToHexadecimal {
    func numValue(_ str: String) -> Int {
        switch str {
        case "a": return 10
        case "b": return 11
        case "c": return 12
        case "d": return 13
        case "e": return 14
        case "f": return 15
        default: return Int(str)!
        }
    }
    func strValue(_ n: Int) -> String {
        switch n {
        case 10: return "a"
        case 11: return "b"
        case 12: return "c"
        case 13: return "d"
        case 14: return "e"
        case 15: return "f"
        default: return String(n)
        }
    }
    
    func toHex(_ num: Int) -> String {
        guard num != 0 else { return "0" }
        var result: [String] = []
        var n = abs(num)
        while n > 0 {
            result = [strValue(n % 16)] + result
            n /= 16
        }
        
        if num < 0 {
            while result.count != 8 {
                result = ["0"] + result
            }
            var i = 7
            var rem = 1
            while i >= 0 {
                let newNum = 15 - numValue(result[i]) + rem
                rem = newNum / 16
                result[i] = strValue(newNum % 16)
                i -= 1
            }
        }
        
        return result.joined()
    }

    func tests() {
        print(toHex(0)) // 0
        print(toHex(1)) // 1
        print(toHex(26)) // 1a
        print(toHex(42)) // 2a
        print(toHex(-1)) // ffffffff
        print(toHex(-26)) // ffffffe6
        print(toHex(-100000)) // fffe7960
    }
}
