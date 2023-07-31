class Maximum69Number {
    func maximum69Number (_ num: Int) -> Int {
        var result = num
        
        var temp = num
        var tens = 1
        while temp > 9 {
            temp /= 10
            tens *= 10
        }
        
        temp = num
        
        while tens > 0 {
            if temp / tens == 6 {
                result += 3 * tens
                return result
            }
            temp -= tens * 9
            tens /= 10
        }
        
        return result
    }
    
    func tests() {
        print(maximum69Number(9669)) // 9969
        print(maximum69Number(9996)) // 9999
        print(maximum69Number(9999)) // 9999
    }
}
