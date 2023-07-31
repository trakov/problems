class ReverseBits {
    func reverseBits(_ n: Int) -> Int {
        radix(n)
    }
    
    func arraySolution(_ n: Int) -> Int {
        var array = Array(repeating: 0, count: 32)
        var n = n
        var i = array.count - 1
        while n > 0 {
            array[i] = n%2
            n/=2
            i-=1
        }
        i = 0
        var two = 1
        while i < array.count {
            n += array[i] * two
            two *= 2
            i += 1
        }
        return n
    }
    
    func radix(_ n: Int) -> Int {
        let nonLeadingZero = String(n, radix: 2)
        let str = String(repeating: "0", count: 32 - nonLeadingZero.count) + nonLeadingZero
        return Int(String(str.reversed()), radix: 2)!
    }

    func tests() {
        print(reverseBits(43261596)) // 964176192
    }
}
