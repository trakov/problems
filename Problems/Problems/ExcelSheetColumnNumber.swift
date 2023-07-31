class ExcelSheetColumnNumber {
    let array: [String] = [
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
        "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
        "U", "V", "W", "X", "Y", "Z", "Z",
    ]
    
    let string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    func titleToNumber(_ columnTitle: String) -> Int {
        var result = 0
        
        for (i, c) in columnTitle.reversed().enumerated() {
            let num = array.firstIndex(of: String(c))! + 1
            var pow = 1
            for _ in 0 ..< i {
                pow *= 26
            }
            result += num * pow
        }
        
        return result
    }
    
    func titleToNumber2(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        
        var result = 0
        
        for char in s.unicodeScalars {
            var num = Int(char.value - 64)
            result = result * 26 + num
        }
        return result
    }

    func tests() {
        print(titleToNumber("A")) // 1
        print(titleToNumber("AB")) // 28
        print(titleToNumber("ZY")) // 701
        print(titleToNumber("ALL")) // 1000
        print(titleToNumber("BXX")) // 2000
    }
}
