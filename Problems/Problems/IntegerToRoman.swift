class IntegerToRoman {
    func intToRoman(_ num: Int) -> String {
        guard num > 0 && num < 4000 else {
            return ""
        }
        var res = ""
        var remainingNum = num
        var romans = Roman.allCases
        while remainingNum > 0 {
            let x = remainingNum % 10
            let roman = romans.removeFirst()
            res = roman.string(for: x) + res
            remainingNum /= 10
        }
        
        return res
    }
    
    enum Roman: CaseIterable, Comparable {
        case zero
        case first
        case second
        case third
        
        var one: String {
            switch self {
            case .zero: return "I"
            case .first: return "X"
            case .second: return "C"
            case .third: return "M"
            }
        }
        
        var five: String {
            switch self {
            case .zero: return "V"
            case .first: return "L"
            case .second: return "D"
            case .third: return ""
            }
        }
        
        var ten: String {
            switch self {
            case .zero: return "X"
            case .first: return "C"
            case .second: return "M"
            case .third: return ""
            }
//            guard let next = (Roman.allCases.first { $0 > self }) else { return "" }
//            return next.one
        }
        
        func string(for number: Int) -> String {
            
            guard number > 0 else { return "" }
            if number < 4 {
                return Array(repeating: one, count: number).joined()
            }
            if number == 4 { return one + five }
            if number == 9 { return one + ten }
            return five + Array(repeating: one, count: number - 5).joined()
        }
    }

    func tests() {
        print(intToRoman(3)) // III
        print(intToRoman(58)) // LVIII
        print(intToRoman(1994)) // MCMXCIV
        print(intToRoman(27)) // XXVII
        print(intToRoman(12)) // XII
//        print(intToRoman(0)) // 0
    }
}
