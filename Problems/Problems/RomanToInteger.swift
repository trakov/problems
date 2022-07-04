class RomanToInteger {
    func romanToInt(_ s: String) -> Int {
        var res = 0
        var prevRoman: Roman!
        for symbol in s {
            let roman = Roman(rawValue: symbol)!
            if prevRoman == nil || roman == prevRoman {
                res += roman.int
            } else if roman > prevRoman {
                res = res - 2 * prevRoman.int + roman.int
            } else {
                res += roman.int
            }
            prevRoman = roman
        }
        return res
    }

    enum Roman: Character, Comparable {
        static func < (lhs: RomanToInteger.Roman, rhs: RomanToInteger.Roman) -> Bool {
            lhs.int < rhs.int
        }
        
        case I = "I"
        case V = "V"
        case X = "X"
        case L = "L"
        case C = "C"
        case D = "D"
        case M = "M"
        
        var int: Int {
            switch self {
            case .I: return 1
            case .V: return 5
            case .X: return 10
            case .L: return 50
            case .C: return 100
            case .D: return 500
            case .M: return 1000
            }
        }
    }
    
    func tests() {
        print(romanToInt("III")) // 3
        print(romanToInt("LVIII")) // 58
        print(romanToInt("MCMXCIV")) // 1994
        print(romanToInt("MCMX")) // 1910
    }
}
