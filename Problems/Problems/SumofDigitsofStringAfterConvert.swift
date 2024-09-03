class SumofDigitsofStringAfterConvert {
    func getLucky(_ s: String, _ k: Int) -> Int {
        var num = 0
        for c in s {
            var n = Int(c.asciiValue! - Character("a").asciiValue! + 1)
            num += n%10 + n/10
        }
        for i in 1..<k {
            var temp = 0
            while num > 0 {
                temp += num % 10
                num /= 10
            }
            num = temp
        }
        return num
    }
    
    func tests() {
        print(getLucky("iiii", 1)) // 36
        print(getLucky("leetcode", 2)) // 6
        print(getLucky("zbax", 2)) // 8
    }
}

