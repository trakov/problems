class NumberComplement {
    func findComplement(_ num: Int) -> Int {
        var m = 1
        while m <= num {
            m <<= 1
        }
        return m - 1 - num
    }
    
    func maxDegree(_ num: Int) -> Int {
        var maxDegreeOfTwo = 1
        while maxDegreeOfTwo <= num {
            maxDegreeOfTwo *= 2
        }
        return maxDegreeOfTwo - 1 - num
    }
    
    func string(_ num: Int) -> Int {
        let str = String(num, radix: 2)
        let result = String(str.map { $0 == "0" ? "1" : "0" })
        return Int(result, radix: 2)!
    }

    func tests() {
        print(findComplement(5)) // 2
        print(findComplement(1)) // 0
        print(findComplement(2)) // 1
        print(findComplement(4)) // 3
    }
}
