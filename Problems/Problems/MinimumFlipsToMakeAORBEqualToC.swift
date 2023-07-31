class MinimumFlipsToMakeAORBEqualToC {
    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        var result = 0
        var a = a
        var b = b
        var c = c
        while a | b | c != 0 {
            if c & 1 == 1 {
                if a & 1 == 0 && b & 1 == 0 {
                    result += 1
                }
            } else {
                result += a & 1 + b & 1
            }
            a >>= 1
            b >>= 1
            c >>= 1
        }
        
        return result
    }
    
    func tests() {
        print(minFlips(2, 6, 5)) // 3
        print(minFlips(4, 2, 7)) // 1
        print(minFlips(1, 2, 3)) // 0
    }
}

