class IntegertoEnglishWords {
    let oneMap: [Int: String] = [
        1:"one",2:"two",3:"three",4:"four",5:"five",
        6:"six",7:"seven",8:"eight",9:"nine"
    ]
    let tenMap: [Int: String] = [
        1:"ten",2:"twenty",3:"thirty",4:"forty",5:"fifty",
        6:"sixty",7:"seventy",8:"eighty",9:"ninety"
    ]
    let tenPlusMap: [Int: String] = [
        0:"ten",1:"eleven",2:"twelve",3:"thirteen",4:"forteen",5:"fifteen",
        6:"sixteen",7:"seventeen",8:"eighteen",9:"nineteen"
    ]
    let tens: [Int: String] = [
        2:"hundred",3:"tousand",6:"million",9:"billion"
    ]
    func tensString(of extent: Int) -> String {
        if extent > 9 { return tens[9]! }
        if extent > 6 { return tens[6]! }
        if extent > 3 { return tens[3]! }
        if extent > 2 { return tens[2]! }
        return ""
    }
    func numberToWords(_ num: Int) -> String {
        var stack: [Int] = []
        var temp = num
        while temp > 0 {
            stack.append(temp % 10)
            temp /= 10
        }
        var result: [String] = []
        while !stack.isEmpty {
            var c = stack.count
            var n = stack.removeLast()
            guard n > 0 else { continue }
            if c % 3 == 1 || c % 3 == 0 {
                result.append(oneMap[n]!)
            } else {
                if n == 1 {
                    n = stack.removeLast()
                    result.append(tenPlusMap[n]!)
                    c -= 1
                    
                } else {
                    result.append(tenMap[n]!)
                }
            }
            
        }
        return result.joined(separator: " ")
    }
    
    func tests() {
        print(numberToWords(123)) // One Hundred Twenty Three
        print(numberToWords(12345)) // Twelve Thousand Three Hundred Forty Five
        print(numberToWords(1234567))
        // One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven
    }
}

