class AddBinary {
    func addBinary(_ a: String, _ b: String) -> String {
        var one = 0
        var result = ""
        var tempA = a
        var tempB = b
        
        func removeLastOrZero(from s: inout String) -> Int {
            s.isEmpty ? 0 : Int(String(s.removeLast()))!
        }
        
        while !tempA.isEmpty || !tempB.isEmpty {
            let lastA = removeLastOrZero(from: &tempA)
            let lastB = removeLastOrZero(from: &tempB)
            let r = lastA + lastB + one
            one = r > 1 ? 1 : 0
            result = "\(r % 2)" + result
        }
        if one == 1 {
            result = "1" + result
        }
        
        return result
    }
    
    func tests() {
        print(addBinary("11", "1")) // 100
        print(addBinary("1010", "1011")) // 10101
    }
}
