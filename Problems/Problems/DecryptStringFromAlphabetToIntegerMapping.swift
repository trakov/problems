class DecryptStringFromAlphabetToIntegerMapping {
    func freqAlphabets(_ s: String) -> String {
        var result = ""
        var i = 0
        var s = Array(s).map { String($0) }
        
        while i < s.count {
            if i + 2 < s.count && s[i+2] == "#" {
                result += String(UnicodeScalar(96 + Int(s[i] + s[i+1])!)!)
                i += 3
            } else {
                result += String(UnicodeScalar(96 + Int(s[i])!)!)
                i += 1
            }
        }
        return result
    }

    func freqAlphabets2(_ s: String) -> String {
//        Characters ('a' to 'i') are represented by ('1' to '9') respectively.
//        Characters ('j' to 'z') are represented by ('10#' to '26#') respectively.
        guard !s.isEmpty else { return s }
        var res = ""
        let s = Array(s)
        var i = 0
        var temp = ""
        while i < s.count {
            temp = String(s[i])
            if Int(temp) ?? 0 > 2 {
                res += charFromChar(temp)
                i += 1
            } else if i + 2 < s.count, charFromString(temp + String(s[i+1]) + String(s[i+2])) != "" {
                res += charFromString(temp + String(s[i+1]) + String(s[i+2]))
                i += 3
            } else {
                res += charFromChar(temp)
                i += 1
            }
        }
        
        return res
    }

    func charFromChar(_ charNum: String) -> String {
        switch charNum {
        case "1": return "a"
        case "2": return "b"
        case "3": return "c"
        case "4": return "d"
        case "5": return "e"
        case "6": return "f"
        case "7": return "g"
        case "8": return "h"
        case "9": return "i"
        default: return ""
        }
    }
    
    func charFromString(_ string: String) -> String {
        switch string {
        case "10#": return "j"
        case "11#": return "k"
        case "12#": return "l"
        case "13#": return "m"
        case "14#": return "n"
        case "15#": return "o"
        case "16#": return "p"
        case "17#": return "q"
        case "18#": return "r"
        case "19#": return "s"
        case "20#": return "t"
        case "21#": return "u"
        case "22#": return "v"
        case "23#": return "w"
        case "24#": return "z"
        case "25#": return "y"
        case "26#": return "z"
        default: return ""
        }
    }

    
    func tests() {
        print(freqAlphabets("10#11#12")) // jkab
        print(freqAlphabets("1326#")) // acz
    }
}
