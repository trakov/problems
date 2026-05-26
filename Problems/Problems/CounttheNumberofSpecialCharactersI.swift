final class CounttheNumberofSpecialCharactersI {
    struct Case: OptionSet {
        let rawValue: Int
        static let none = Case([])
        static let lower = Case(rawValue: 1 << 0)
        static let upper = Case(rawValue: 1 << 1)
        static let all: Case = [.lower, .upper]
    }
    func numberOfSpecialChars(_ word: String) -> Int {
        var map: [String: Case] = [:]
        for c in word {
            map[c.lowercased(), default: .none].insert(c.isLowercase ? .lower : .upper)
        }
        return map.values.count { $0 == .all }
    }
    
    func tests() {
        print(numberOfSpecialChars("aaAbcBC")) // 3
        print(numberOfSpecialChars("abc")) // 0
        print(numberOfSpecialChars("abBCab")) // 1
    }
}
