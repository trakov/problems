class ExcelSheetColumnTitle {
    let array: [String] = [
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
        "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
        "U", "V", "W", "X", "Y", "Z"
    ]
    
    func convertToTitle(_ columnNumber: Int) -> String {
        var num = columnNumber
        var result = ""
        while num > 0 {
            let char = array[(num - 1) % 26]
            result += char
            num = (num - 1) / 26
        }
        return String(result.reversed())
    }

    func tests() {
        for i in 700 ... 704 {
            print(i, convertToTitle(i))
        }
        print(convertToTitle(1)) // A
        print(convertToTitle(26)) // Z
        print(convertToTitle(27)) // AA
        print(convertToTitle(28)) // AB
        print(convertToTitle(52)) // AZ
        print(convertToTitle(78)) // BZ
        print(convertToTitle(701)) // ZY
        print(convertToTitle(702)) // ZZ
        print(convertToTitle(1000)) // ALL
        print(convertToTitle(2000)) // BXX
    }
}
