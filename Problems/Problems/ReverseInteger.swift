class ReverseInteger {
    func reverse(_ x: Int) -> Int {
        guard let x32 = Int32(exactly: x) else {
            return 0
        }
        print(x, x32)
        let minus = x32.signum()
        print(minus)
        let str = String(String(Int64(x32) * Int64(minus)).reversed())
        print(str)
        guard let result = Int32(exactly: minus * (Int32(str) ?? 0)) else {
            return 0
        }
        print(result)
        return Int(result)
    }
    
    func tests() {
//        print(reverse(123))
//        print(reverse(-123))
//        print(reverse(120))
//        print(reverse(0))
//        print(reverse(Int(Int32.max)))
        print(reverse(Int(Int32.min)))
    }
}
