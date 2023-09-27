class DecodedStringAtIndex {
    func decodeAtIndex(_ s: String, _ k: Int) -> String {
        var count = 0
        for char in s {
            if char.isLetter {
                count += 1
            } else {
                let num = Int(String(char))!
                count *= num
            }
        }
        var k = k
        for char in s.reversed() {
            if char.isLetter {
                if k == count || k == 0 {
                    return String(char)
                }
                count -= 1
            } else {
                let num = Int(String(char))!
                count /= num
                k %= count
            }
        }
        fatalError()
    }
    
    func tests() {
        print(decodeAtIndex("leet2code3", 10)) // o
        print(decodeAtIndex("ha22", 5)) // h
        print(decodeAtIndex("a2345678999999999999999", 1)) // a
    }
}

