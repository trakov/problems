final class DesignSpreadsheet {
    class Spreadsheet {
        var hash = [String : Int]()

        init(_ rows: Int) {
            hash = [:]
        }
        
        func setCell(_ cell: String, _ value: Int) {
            hash[cell] = value
        }
        
        func resetCell(_ cell: String) {
            hash[cell] = 0
        }
        
        func getValue(_ formula: String) -> Int {
            let s = formula.dropFirst(1).split(separator: "+")
            let val0 = Int(String(s[0])) ?? hash[String(s[0])] ?? 0
            let val1 = Int(String(s[1])) ?? hash[String(s[1])] ?? 0
            return val0 + val1
        }
    }
    
    func tests() {
        let s = Spreadsheet(3)
        print(s.getValue("=5+7")) // 12
        s.setCell("A1", 10)
        print(s.getValue("=A1+6")) // 16
        s.setCell("B2", 15)
        print(s.getValue("=A1+B2")) // 25
        s.resetCell("A1")
        print(s.getValue("=A1+B2")) // 15
    }
}
