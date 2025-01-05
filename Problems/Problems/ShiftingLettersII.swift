class ShiftingLettersII {
    func shiftingLetters(_ s: String, _ shifts: [[Int]]) -> String {
        let n = s.count
        var diffArray = Array(repeating: 0, count: n)
        for shift in shifts {
            let move = shift[2] == 1 ? 1 : -1
            diffArray[shift[0]] += move
            if shift[1] + 1 < n {
                diffArray[shift[1] + 1] -= move
            }
        }
        var result = Array(s)
        var numberOfShifts = 0
        let a = Character("a").asciiValue!
        for (i, (c, diff)) in zip(s, diffArray).enumerated() {
            numberOfShifts = (numberOfShifts + diff) % 26
            if numberOfShifts < 0 { numberOfShifts += 26 }
            let ascii = a + (c.asciiValue! - a + UInt8(numberOfShifts)) % 26
            let shiftedChar = Character(UnicodeScalar(ascii))
            result[i] = shiftedChar
        }
        return String(result)
    }
    
    func tests() {
        print(shiftingLetters("abc", [[0,1,0],[1,2,1],[0,2,1]])) // "ace"
        print(shiftingLetters("dztz", [[0,0,0],[1,1,1]])) // "catz"
    }
}

