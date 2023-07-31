class AddDigits {
    func addDigits(_ num: Int) -> Int {
        var n = num
        while n > 9 {
            n = n % 10 + n / 10
        }
        return n
    }

    func recursive(_ num: Int) -> Int {
        guard num > 9 else { return num }
        let n = (num % 10) + num / 10
        return addDigits(n)
    }

    func tests() {
        print(addDigits(38)) // 2
        print(addDigits(0)) // 0
        print(addDigits(100)) // 1
        print(addDigits(999)) // 9
    }
}
