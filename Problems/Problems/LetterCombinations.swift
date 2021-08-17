class LetterCombinations {
    func letterCombinations(_ digits: String) -> [String] {
        var result: [String] = []
        let nums = digits.compactMap { Int(String($0)) }
        for num in nums {
            let letters = LetterCombinations.Letters[num]!
            if result.isEmpty {
                for letter in letters {
                    result.append(letter)
                }
            } else {
                let prevResult = result
                for letter in letters {
                    let withLetter = prevResult.map {
                        $0 + letter
                    }
                    result.append(contentsOf: withLetter)
                }
                result.removeFirst(prevResult.count)
            }
        }
        return result
    }

    static var Letters: [Int: [String]] = [
        2: ["a", "b", "c"],
        3: ["d", "e", "f"],
        4: ["g", "h", "i"],
        5: ["j", "k", "l"],
        6: ["m", "n", "o"],
        7: ["p", "q", "r", "s"],
        8: ["t", "u", "v"],
        9: ["w", "x", "y", "z"]
    ]
    
    func letters(for digit: Int) -> [String] {
        switch digit {
        case 2:
            return ["a", "b", "c"]
        case 3:
            return ["d", "e", "f"]
        case 4:
            return ["g", "h", "i"]
        case 5:
            return ["j", "k", "l"]
        case 6:
            return ["m", "n", "o"]
        case 7:
            return ["p", "q", "r", "s"]
        case 8:
            return ["t", "u", "v"]
        case 9:
            return ["w", "x", "y", "z"]
        default:
            return []
        }
    }
    
    func tests() {
        print(letterCombinations("7777"))// ["ad","ae","af","bd","be","bf","cd","ce","cf"]
//        print(letterCombinations(""))// []
//        print(letterCombinations("2"))// ["a","b","c"]
    }
}
